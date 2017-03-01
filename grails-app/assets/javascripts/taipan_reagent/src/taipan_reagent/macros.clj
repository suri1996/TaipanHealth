(ns taipan_reagent.macros)

(defmacro defvar [s]
  (let [s2 (symbol (format "js/window.%s" s))]
    `(def ~s (if ~s2 (cljs.reader/read-string ~s2)))))

(defmacro defm [symbol arglist m & rest]
  `(def ~symbol (with-meta (fn ~arglist ~@rest) ~m)))
