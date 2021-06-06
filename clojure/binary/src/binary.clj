(ns binary)

(defn to-decimal [bits]
  (reduce #(+ (* 2 %1) (if (= %2 \1) 1 0)) 0 bits))
