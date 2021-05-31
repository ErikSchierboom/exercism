(ns flatten-array)

(defn flatten [arr]
  (loop [acc [] [head & tail] arr]
    (cond
      (nil? head) (if (nil? tail) acc (recur acc tail))
      (sequential? head) (recur acc (concat head tail))
      :else (recur (conj acc head) tail))))
