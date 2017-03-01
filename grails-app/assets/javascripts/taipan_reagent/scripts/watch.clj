(require '[cljs.build.api :as b])

(b/watch "src"
  {:main 'taipan_reagent.core
   :optimizations :advanced
   :output-to "release/taipan_reagent.js"
   :output-dir "out"})
