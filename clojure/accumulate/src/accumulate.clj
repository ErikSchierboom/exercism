(ns accumulate)

(defn accumulate
  ([callback elements] (accumulate callback elements []))
  ([callback elements acc]
    (if (empty? elements)
      acc
      (recur callback (rest elements) (conj acc (callback (first elements)))))))
