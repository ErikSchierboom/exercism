(ns hamming)

(defn distance [strand1 strand2]
  (when (= (count strand1) (count strand2))
    (count (filter false? (map = strand1 strand2)))))
