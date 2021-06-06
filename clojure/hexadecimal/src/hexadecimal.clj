(ns hexadecimal)

(def hexadecimal-mapping {\0 0 \1 1 \2 2 \3 3 \4 4 \5 5 \6 6 \7 7 \8 8 \9 9 \a 10 \b 11 \c 12 \d 13 \e 14 \f 15})

(defn hex-to-int [bits]
  (if (every? hexadecimal-mapping bits)
    (reduce #(+ (* 16 %1) (get hexadecimal-mapping %2)) 0 bits)
    0))
