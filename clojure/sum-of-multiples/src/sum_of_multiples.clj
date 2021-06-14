(ns sum-of-multiples)

(defn sum-of-multiples [multiples n]
  (let [multiple? (fn [m] (some #(zero? (mod m %)) multiples))]
    (reduce + (filter multiple? (range 1 n)))))
