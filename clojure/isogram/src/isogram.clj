(ns isogram (:require [clojure.string :as str]))

(defn isogram? [sentence]
  (->> sentence
       (str/lower-case)
       (filter Character/isLetter)
       (apply distinct?)))
