(ns roman-numerals)

(def numeral-thresholds
  [[1000  "M"]
   [ 900 "CM"]
   [ 500  "D"]
   [ 400 "CD"]
   [ 100  "C"]
   [  90 "XC"]
   [  50  "L"]
   [  40 "XL"]
   [  10  "X"]
   [   9 "IX"]
   [   5  "V"]
   [   4 "IV"]
   [   1  "I"]])

(defn numerals
  ([n] (numerals n "" numeral-thresholds))
  ([n acc [[threshold numeral] & rest]]
    (cond
      (nil? threshold) acc
      (<= threshold n) (recur (- n threshold) (str acc numeral) (conj rest [threshold numeral]))
      :else (recur n acc rest))))
