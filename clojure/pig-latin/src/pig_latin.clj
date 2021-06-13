(ns pig-latin (:require [clojure.string :as str]))

(def vowel-regex #"(?<begin>^|\s+)(?<vowel>a|e|i|o|u|yt|xr)(?<rest>\w+)")
(def consonant-regex #"(?<begin>^|\s+)(?<consonant>ch|qu|thr|th|sch|yt|\wqu|\w)(?<rest>\w+)")

(def vowel-replacement "${begin}${vowel}${rest}ay")
(def consonant-replacement "${begin}${rest}${consonant}ay")

(defn translate [word]
  (if (re-matches vowel-regex word)
    (str/replace word vowel-regex vowel-replacement)
    (str/replace word consonant-regex consonant-replacement)))
