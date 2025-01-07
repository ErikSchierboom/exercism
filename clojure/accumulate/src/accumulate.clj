(ns accumulate)

(defn accumulate [f coll]
  (loop [coll coll
         acc []]
    (if-let [[x & xs] (seq coll)]
      (recur xs (conj acc (f x)))
      acc)))
