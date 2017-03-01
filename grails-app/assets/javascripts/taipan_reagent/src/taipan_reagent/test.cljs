(ns taipan-reagent.test
  (:require
    [clojure.browser.repl :as repl]
    [reagent.core :as r :refer [atom]]
    [cljs.reader :refer [read-string]]
    )
  (:require-macros
    [taipan_reagent.macros :refer [defvar]])
    )

(def radio-atom (atom 1))


(defn bill-table []
  [:form {:action "http://reflect-http.herokuapp.com" :method "POST"}
  [:input {:type "radio" :name "x" :value 1 :checked (= @radio-atom 1) :on-change #(reset! radio-atom 1)}]
  [:input {:type "radio" :name "x" :value 2 :checked (= @radio-atom 2) :on-change #(reset! radio-atom 2)}]
  [:input {:type "submit"}]
  ;[:input {:type "text" :default-value "ok"}]
  ])

(defn ^:export main []
  (r/render-component [bill-table] (js/document.getElementById "bill_form_div")))
