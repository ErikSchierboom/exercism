(ns grade-school)

(defn grade [school grade]
  (get school grade []))

(defn add [school name grade]
  (merge-with concat school {grade [name]}))

(defn sorted [school]
  (into (sorted-map) (for [[grade names] school] [grade (sort names)])))
