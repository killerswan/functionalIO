(set! *warn-on-reflection* true)

(def filename (first *command-line-args*))
(use '[clojure.java.io :only [input-stream]]) 
(def s (input-stream filename)) 

(defn hmm [n] 
   
   (def b (.read ^java.io.BufferedInputStream s)) 
   (cond
      (== b -1)
         n
      :else
         (recur (bit-xor n b))))

(println "Clojure XOR of bytes: " (hmm 0))
