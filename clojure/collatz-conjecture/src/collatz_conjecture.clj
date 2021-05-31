(ns collatz-conjecture)

(defn collatz
  ([num acc]
    (cond
      (< num 1) (throw (IllegalArgumentException. "Number must be greater than or equal to 1"))
      (= num 1) acc
      :else (recur (if (even? num) (/ num 2) (inc (* num 3))) (inc acc))))
  ([num] (collatz num 0)))
