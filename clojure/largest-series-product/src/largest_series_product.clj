(ns largest-series-product)

(defn largest-product [size input]
  (cond
    (zero? size) 1
    (re-matches (re-pattern (str "^\\d{" size ",}$")) input)
      (->> input
           (map #(Character/digit^char % 10))
           (partition size 1)
           (map #(reduce * %))
           (apply max 0))
    :else (throw (IllegalArgumentException. "Invalid input"))))
