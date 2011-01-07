
;OMG this is slow

(set! *warn-on-reflection* true)

(def filename (first *command-line-args*))
(use '[clojure.java.io :only [input-stream]]) 
(def s (input-stream filename)) 
; (def s (input-stream "/code/bin/godoc"))     

(defn ^int hmm [n] 
   (def b ^int (^int .read s)) 
   (cond
      (<= b -1)
         n
      :else
         (recur ^int (bit-xor n b))))

(println "Clojure XOR of bytes (demand?): " (hmm 0))
