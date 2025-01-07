(ns armstrong-numbers)

(defn- pow [n m] (int (Math/pow n m)))

(defn- digit [c] (Character/digit c 10))

(defn- armstrong-sum [n]
  (let [digits (map digit (str n))
        power (count digits)]
    (reduce + (map #(pow % power) digits))))

(defn armstrong? [n] (= (armstrong-sum n) n))
