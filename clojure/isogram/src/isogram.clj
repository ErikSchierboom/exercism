(ns isogram (:require [clojure.string :as str]))

(defn isogram? [sentence]
  (let [letters (filter Character/isLetter (str/lower-case sentence))]
    (= (distinct letters) letters)))
