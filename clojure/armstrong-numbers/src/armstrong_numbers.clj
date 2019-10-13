(ns armstrong-numbers)

(defn armstrong? [number]
  (def digits (map #(Character/getNumericValue %) (str number)))
  (def power (count digits))
  (defn digit-to-power [digit] (Math/pow digit power))
  (def armstrong-value (reduce + (map digit-to-power digits)))
  (== number armstrong-value))
