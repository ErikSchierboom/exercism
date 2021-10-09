(ns anagram
  (:require [clojure.string :as str]))

(defn anagram-of? [word candidate]
  (let [lower-word (str/lower-case word)
        lower-candidate (str/lower-case candidate)]
    (and
      (not= lower-word lower-candidate)
      (= (sort lower-word) (sort lower-candidate))))) 

(defn anagrams-for [word prospect-list]
  (filter (partial anagram-of? word) prospect-list))
 
