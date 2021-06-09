(ns perfect-numbers)

(defn- aliquot-sum [n]
  (apply + (filter #(zero? (mod n %)) (range 1 (inc (quot n 2))))))

(defn classify [n]
  (if (neg? n)
    (throw (IllegalArgumentException. "Negative numbers are not allowed"))
    (let [sum (aliquot-sum n)]
      (cond
        (= sum n) :perfect
        (> sum n) :abundant
        :else     :deficient))))
