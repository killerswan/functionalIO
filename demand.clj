
;OMG this is slow

;(set! *warn-on-reflection* true)

(def filename (first *command-line-args*))
(use '[clojure.java.io :only [input-stream]]) 
(def s (input-stream filename)) 
;(def s (input-stream "/code/bin/godoc"))     

(defn hmm [n] 
   
   (def b (.read s)) 
   (cond
      (== b -1)
         n
      :else
         ;(recur n)))
         (recur (bit-xor n b))))

(println "Clojure XOR of bytes: " (hmm 0))
