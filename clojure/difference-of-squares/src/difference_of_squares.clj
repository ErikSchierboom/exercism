(ns difference-of-squares)

(defn- square [n] (* n n))
(defn- natural-numbers [n] (range 1 (inc n)))

(defn sum-of-squares [n] (reduce + (map square (natural-numbers n))))
(defn square-of-sum [n] (square (reduce + (natural-numbers n))))
(defn difference [n] (- (square-of-sum n) (sum-of-squares n)))

