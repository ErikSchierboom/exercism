(ns luhn (:require [clojure.string :as str]))

(defn valid? [input]
  (let [digits (map #(Character/digit^char % 10) (str/replace input " " ""))
        multipliers (cycle (if (even? (count digits)) [2 1] [1 2]))
        doubled-digits (map * digits multipliers)
        normalized-digits (map #(if (> % 9) (- % 9) %) doubled-digits)
        sum (reduce + normalized-digits)]
    (and (> (count digits) 1) (zero? (mod sum 10)))))
