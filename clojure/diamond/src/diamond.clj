(ns diamond)

(defn- row [letter-count [row letter]]
  (let [outer-spaces (apply str (repeat (- letter-count row 1) " "))
        inner-spaces (apply str (repeat (if (zero? row) row (dec (* row 2))) " "))]
    (if (= letter \A)
      (format "%s%c%s" outer-spaces letter outer-spaces)
      (format "%s%c%s%c%s" outer-spaces letter inner-spaces letter outer-spaces))))

(defn diamond [letter]
  (let [letters (take-while #(>= 0 (compare % letter)) "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        indexed-letters (map-indexed vector letters)
        row-letters (concat indexed-letters (rest (reverse indexed-letters)))]
    (map #(row (count letters) %) row-letters)))
