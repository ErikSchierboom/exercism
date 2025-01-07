(ns collatz-conjecture)

(defn- step [n] (if (even? n) (quot n 2) (inc (* n 3))))
(defn- collatz-sequence [n] (take-while #(not= 1 %) (iterate step n)))

(defn collatz [n]
  (if (< n 1)
    (throw (IllegalArgumentException. "Number must be greater than or equal to 1"))
    (count (collatz-sequence n))))
