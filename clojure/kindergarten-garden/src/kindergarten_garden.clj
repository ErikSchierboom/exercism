(ns kindergarten-garden)

(def children [:alice :bob :charlie :david :eve :fred :ginny :harriet :ileana :joseph :kincaid :larry])
(def plant { \G :grass \C :clover \R :radishes \V :violets })

(defn garden [rows]
  (let [plants (keep plant rows)
        [first-row second-row] (partition (/ (count plants) 2) plants)]
    (zipmap children (map concat (partition 2 first-row) (partition 2 second-row)))))