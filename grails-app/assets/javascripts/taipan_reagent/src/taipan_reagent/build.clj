(ns taipan_reagent.build)

(require '[cljs.build.api :as b])
(import java.awt.Toolkit)

(let [start (System/nanoTime)]
  (b/build "src"
    {:output-to "release/taipan_reagent.js"
     :output-dir "release"
     :optimizations :whitespace
     :verbose true})
  (println "... done. Elapsed" (/ (- (System/nanoTime) start) 1e9) "seconds"))

(.beep (Toolkit/getDefaultToolkit))
