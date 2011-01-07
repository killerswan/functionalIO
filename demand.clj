(set! *warn-on-reflection* true)

(def filename (first *command-line-args*))
(use '[clojure.java.io :only [input-stream]]) 
(def stream (input-stream filename)) 

(defn slowjure [n] 
   (def b (.read ^java.io.BufferedInputStream stream)) 
   (cond
      (== b -1)
         n
      :else
         (recur (bit-xor n b))))

(println "Clojure XOR of bytes: " (slowjure 0))
