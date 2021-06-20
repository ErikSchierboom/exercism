(ns all-your-base)

(defn- to-decimal [from-base digits]
  (reduce #(+ (* %1 from-base) %2) 0 digits))

(defn- from-decimal
  ([to-base decimal]
    (from-decimal to-base decimal '()))
  ([to-base decimal digits]
    (if (zero? decimal) digits (recur to-base (quot decimal to-base) (conj digits (rem decimal to-base))))))

(defn convert [from-base digits to-base]
  (cond
    (empty? digits) '()
    (every? zero? digits) '(0)
    (<= from-base to-base 1) nil
    :else (->> digits
               (to-decimal from-base)
               (from-decimal to-base))))

