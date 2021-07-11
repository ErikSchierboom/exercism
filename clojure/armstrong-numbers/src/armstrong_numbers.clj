(ns armstrong-numbers)

(defn- digits [number]
  (map #(Character/digit ^char % 10) (str number)))

(defn- armstrong [number]
  (let [digits' (digits number)]
    (reduce + (map #(Math/pow % (count digits')) digits'))))

(defn armstrong? [number]
  (== (armstrong number) number))