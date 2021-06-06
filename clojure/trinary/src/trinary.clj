(ns trinary)

(defn to-decimal [bits]
  (if (every? #{\0 \1 \2} bits)
    (reduce #(+ (* 3 %1) (cond (= %2 \2) 2 (= %2 \1) 1 :else 0)) 0 bits)
    0))
