(ns anagram
  (:require [clojure.string :refer [lower-case]]))

(defn normalize-word [word]
  (sort (lower-case word)))

(defn is-anagram? [word candidate-word]
  (and
    (not= (lower-case candidate-word) (lower-case word))
    (= (normalize-word word) (normalize-word candidate-word))))

(defn anagrams-for [word prospect-list]
  (filter (partial is-anagram? word) prospect-list))

