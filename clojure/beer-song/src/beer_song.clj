(ns beer-song (:require [clojure.string :as str]))

(defn- bottle-count [num]
  (case num
    0 "no more bottles of beer"
    1 "1 bottle of beer"
    (str num " bottles of beer")))

(defn- action [num]
  (case num
    0 "Go to the store and buy some more"
    1 "Take it down and pass it around"
    "Take one down and pass it around"))

(defn verse [num]
  (str (str/capitalize (bottle-count num)) " on the wall, " (bottle-count num) ".\n"
       (action num) ", " (bottle-count (if (zero? num) 99 (dec num))) " on the wall.\n"))

(defn sing
  ([start] (sing start 0))
  ([start end] (apply str (interpose "\n" (reverse (map verse (range end (inc start))))))))
