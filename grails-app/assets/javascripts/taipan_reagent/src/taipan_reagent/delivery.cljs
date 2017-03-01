(ns taipan-reagent.delivery
  (:require
    [clojure.browser.repl :as repl]
    [reagent.core :as r :refer [atom]]
    [cljs.reader :refer [read-string]]
    [linked.core :as linked]
    [s3-beamer.client :as s3]
    )
  (:require-macros
    [taipan_reagent.macros :refer [defvar defm]]
    )
  )

;; (defonce conn
;;   (repl/connect "http://localhost:9000/repl"))

(enable-console-print!)

(defvar messages)
(defvar territories)

(def choice-delivery (atom 3))
(def file-uploads (atom (linked/map)))
(def xhrs (cljs.core/atom {}))
(def uploading (cljs.core/atom #{}))
(def num-file-uploaders (atom 1))

(defn abort [filename]
  (.abort (@xhrs filename))
  (doseq [atom [file-uploads xhrs]]
    (swap! atom dissoc filename)))

(set! js/t #(prn (deref %)))

(defn wrap-files [files]
  (let [data (js/FormData.)]
    (doseq [file files]
      (.append data (.-name file) file))
    data))

(defn send-file-server [file]
  (let [
         total-size (.-size file)
         file-name (.-name file)
         data (doto (js/FormData.) (.append (.-name file) file))
         options #js {:url "empty"
                      :data data
                      :type "POST"
                      :contentType false
                      :processData false
                      :xhr (fn []
                             (let [xhr (js/$.ajaxSettings.xhr)]
                               (set! (-> xhr .-upload .-onprogress)
                                     (fn [progress]
                                       (let [
                                              percentage (* 100 (/ (.-loaded progress) total-size))
                                              ]
                                         (swap! file-uploads assoc file-name percentage))))
                               (set! (-> xhr .-upload .-onload)
                                     (fn []
                                       (swap! file-uploads assoc file-name 100)))
                               (swap! xhrs assoc file-name xhr)
                               xhr))}
         ]
    (js/$.ajax options)))


(defn send-file-beam [file]
  (println "Sending file to beam")
  (let [
         total-size (.-size file)
         file-name (.-name file)
         ]
    (s3/upload {:file file
                :success-fn #(swap! file-uploads assoc file-name 100)
                :upload-listener (fn [progress]
                                   (let [
                                          percentage (* 100 (/ (.-loaded progress) total-size))
                                          ]
                                     (swap! file-uploads assoc file-name percentage)))
                :xhr-handler (fn [xhr]
                               (swap! xhrs assoc file-name xhr))
                })))


(defn send-files [files]
  (swap! num-file-uploaders inc)
  (doseq [file (array-seq files)]
    (send-file-beam file)))

(defn full-width-row [contents]
  [:div {:class "row text-center"}
   [:div {:class "col-xs-12"}
    contents]])

(defn bill-table []
  [:div
   [:form {:method "post" :id "bill_form" :action "medicalBill_summary"}
    [:input {:type "hidden" :name "question" :value js/question}]
    [:div
     [:input {:type "radio" :name "choice_delivery" :value 1 :id "choice-delivery-mail" :checked (= @choice-delivery 1) :on-change #(reset! choice-delivery 1)}]
     [:label {:for "choice-delivery-mail"}
      [:p (messages "express_mail")]]]
    [:div
     [:input {:type "radio" :name "choice_delivery" :value 2 :id "choice-delivery-address" :checked (= @choice-delivery 2) :on-change #(reset! choice-delivery 2)}]
     [:label {:for "choice-delivery-address"}
      [:p (messages "pick_it_up")]]
     [:div {:class "radioactive" :id "address-"} ;this really ought to be brought under the control of reagent
      [:label {:for "address"} [:p (messages "completed_address")]]
      [:div {:class "form-group"}
       [:div {:class "row"}
        [:input {:name "address1" :class "form-control" :type "text" :required true}]]
       [:div {:class "row"}
        [:input {:name "address2" :class "form-control" :type "text" :required true}]]]
      [:select {:name "territory_name" :class "form-control" :id "territory_name"}
       (for [territory (conj territories (messages "select_territory"))]
         ^{:key territory}
         [:option {:value territory} territory])]
      [:input {:name "country" :type "text" :class "form-control" :value "Hong Kong" :read-only true}]
      [:label {:for "address"} (messages "enter_phone")]
      [:div {:class "form-group"}
       [:div {:class "row"}
        [:input {:name "phone" :class "form-control" :type "tel" :required true}]]]]]
    [:div
     [:input {:type "radio" :name "choice_delivery" :value 3 :id "choice-delivery-upload" :checked (= @choice-delivery 3) :on-change #(reset! choice-delivery 3)}]
     [:label {:for "choice-delivery-upload"}
      [:p (messages "upload")]]
     ]]
   (if (= 3 @choice-delivery)
     [:div
      (for [[filename progress] @file-uploads
            :let [width (str (.toFixed progress 0) "%")]]
        ^{:key filename}
        [:div
         [:div {:class "progress"}
          [:div {:class "progress-bar" :role "progressbar" :aria-valuenow (.toFixed progress 0) :aria-valuemin 0 :aria-valuemax 100 :style {:width width}
                 }
           filename]]
         [full-width-row width]
         [:button {:type "button" :class "btn btn-default" :on-click #(abort filename)} "Cancel"]
         ])
      (let [num-file-uploaders @num-file-uploaders]
        (for [input-counter (range num-file-uploaders)]
          ^{:key input-counter}
          [:input {:id "uploader" :type "file" :multiple true :on-change #(->> % .-target .-files send-files)
                   :style (if (= input-counter (dec num-file-uploaders)) {} {:display "none"})}]))])
   ])

(defn ^:export main []
  (r/render-component [bill-table] (js/document.getElementById "bill_form_div")))
