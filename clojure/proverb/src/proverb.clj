(ns proverb (:require [clojure.string :as str]))

(defn recite [pieces]
  (if
    (empty? pieces) ""
    (->> pieces
         (partition 2 1)
         (map #(str "For want of a " (first %) " the " (second %) " was lost."))
         (#(concat % [(str "And all for the want of a " (first pieces) ".")]))
         (str/join "\n"))))
