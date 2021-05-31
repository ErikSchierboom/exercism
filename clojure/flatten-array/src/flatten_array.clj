(ns flatten-array)

(defn flatten [arr]
  (loop [acc []
         remainder arr]
    (if (empty? remainder)
      acc
      (let [[head & tail] remainder]
        (cond
          (sequential? head) (recur acc (concat head tail))
          (nil? head) (recur acc tail)
          :else (recur (conj acc head) tail))))))
