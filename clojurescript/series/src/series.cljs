(ns series)

(defn slices [string length]
  (if (zero? length)
    [""]
    (mapv #(apply str %) (partition length 1 string))))
