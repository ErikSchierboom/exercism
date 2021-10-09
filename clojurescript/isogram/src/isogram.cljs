(ns isogram (:require [clojure.string :as str]))

(defn isogram? [sentence]
  (let [letters (re-seq #"(?u)\p{L}" (str/lower-case sentence))]
    (= (distinct letters) letters)))