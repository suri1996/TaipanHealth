(ns taipan_reagent.core
  (:require
    [clojure.browser.repl :as repl]
    [reagent.core :as r :refer [atom]]
    [cljs.reader :refer [read-string]]
    )
  (:require-macros
    [taipan_reagent.macros :refer [defvar]])
    )

;; (defonce conn
;;   (repl/connect "http://localhost:9000/repl"))

(enable-console-print!)

(defn safe-read-string [x] (if x (read-string x)))
(defvar messages)
(def members (conj (safe-read-string js/window.members) ["Please Select" -1]))
(def member (atom -1))

(def error (atom nil))
(def error-messages {:no-services "No Items Selected" :no-member "Select Member"})

(def selection (atom {}))
(defn safe-inc [x] (if x (inc x) 1))
(defn safe-dec [x] (if (and x (> x 0)) (dec x) 0))

(defn inc-selection [product]
  (swap! selection update-in [product] safe-inc))
(defn dec-selection [product]
  (swap! selection update-in [product] safe-dec))

(defn total-price [products]
    (apply + (map (fn [[product price]] (* price (@selection product 0))) products)))

(defn submit-bill-form [products]
  (cond
    (zero? (total-price products)) (reset! error :no-services)
    (= -1 @member) (reset! error :no-member)
    :default (.submit (js/$ "#bill_form"))
    ))

(defn bill-table [products]
  (let [
    selection-value @selection
    ]
  [:form {:method "post" :id "bill_form" :action "question"}
    [:div {:class "table-responsive"}
      [:table {:class "table table-striped table-bordered table-hover" :id "product_table"}
        [:thead
          [:tr
            [:th (messages "my.localized.services")]
            [:th (messages "my.localized.price_hkd")]
            [:th (messages "my.localized.quantity")]
          ]
        ]
        [:tbody
          (for [[product price] products]
            ^{:key product}
            [:tr
              [:td
                [:input {:type "hidden" :value product :name "name"}]
                product
              ]
              [:td
                [:input {:type "hidden" :value price :name "price"}]
                "$" (.toFixed price 2)
              ]
              [:td
                [:input {:name "quan" :class "center" :type "text" :value (selection-value product 0)}]
                [:div
                  [:span {
                    :class "badge"
                    :style {:margin-right "5%" :color "#ff6666"}
                    :on-click (fn [] (dec-selection product))
                    } [:b "-"]]
                  [:span {
                    :class "badge"
                    :style {:color "#00cc99"}
                    :on-click #(inc-selection product)
                    } [:b "+"]]
                ]
              ]
            ]
          )
        ]
        [:tfoot
          [:tr
            [:td {:colspan 2} (messages "my.localized.total")]
            [:td {:id "total" :class "center"} "$" (.toFixed (total-price products) 2)]
          ]
        ]
      ]
    ]
    [:div {:class "row"}
      [:div {:class "col-md-6 member"}
        (messages "my.localized.member") " "
        [:span {:id "tooltip"}
          [:span {:class "glyphicon glyphicon-info-sign"}
            [:p "Person requiring treatment."]]
            [:select {:id "member_select" :name "member_select"
              :class "form-control"
              :value @member
              :on-change #(reset! member (-> % .-target .-value))
              }
              (for [[name id] members]
                ^{:key id}
                [:option {:value id} name])
              ]
            ]
      ]
      [:a {
        :id "add_member" :data-title "Edit"
        :data-toggle "modal" "data-target" "#edit"
        :class "col-md-12"
        }
        (messages "my.localized.add_member")
      ]
      #_(if @error [:div {:class "col-md-12"}
        [:p {:style {:color "#EF3A3A"}} (error-messages @error)]])
        (if @error [:div {:class "alert alert-danger"} (error-messages @error)])
      [:br][:br][:br]
      [:div {:class "row"}
        [:div {:class "right"}
          [:button {
            :type "button"
            :id "addCart"
            :class "x btn btn-success"
            :on-click #(submit-bill-form products)
            } "Next"]]]
    ]
    [:input {:type "hidden" :name "back" :value "1"}]
    [:input {:type "hidden" :name "type" :id "type" :value ""}]
  ]
))

(defn ^:export t [] (prn @error))

(defn ^:export main [products]
  (r/render-component [bill-table (read-string products)] (js/document.getElementById "bill_form_div")))
  ;   <div class = "row">
  ;     <div class = "col-md-6"><p id = "error">No item is selected</p></div>
  ;     <div class = "col-md-6 member">
  ;       <g:message code = "my.localized.member" /> <span id="tooltip"><span class="glyphicon glyphicon-info-sign"><p>You can choose to use our service for yourself, your family or your friends. Click on "Add a Member" to add to your member list.</p></span></span>
  ;       <g:if test = "${members.size() > 0}">
  ;         <g:select id = "member_select" name = "member_select"  class="form-control" value="${members.first().id}" from = "${members}" optionKey = "id" optionValue = "firstName" noSelection="${['': 'Please Select']}"  required = "required" />
  ;       </g:if>
  ;       <g:else>
  ;         <g:select id = "member_select" name = "member_select"  class="form-control"  from = "${members}" optionKey = "id" optionValue = "firstName" noSelection="${['': 'Please Select']}"  required = "required" />
  ;       </g:else>
  ;     </div>
  ;   </div>
  ;   <a id = "add_member" data-title="Edit" data-toggle="modal" data-target="#edit"  style="float:right"><g:message code = "my.localized.add_member"/></a>
  ;   <br><br><br>
  ;   <div class = "row">
  ;     <div class="right">
  ;       <button type = "button"  id = "addCart"  class="x btn btn-success">Proceed to Pay</button>
  ;     </div>
  ;   </div>
  ;   <input type = "hidden" name = "back" value = "1" />
  ;   <input type = "hidden" name = "type"  id = "type" value = "" />
  ; </form>
