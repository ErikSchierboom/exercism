(ns octal)

(def octal-mapping {\0 0 \1 1 \2 2 \3 3 \4 4 \5 5 \6 6 \7 7})

(defn to-decimal [bits]
  (if (every? octal-mapping bits)
    (reduce #(+ (* 8 %1) (get octal-mapping %2)) 0 bits)
    0))
