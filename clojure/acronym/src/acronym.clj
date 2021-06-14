(ns acronym (:require [clojure.string :as str]))

(defn acronym [sentence]
  (->> 
    (re-seq #"[A-Z]+[a-z]*|[a-z]+" sentence)
    (map first)
    (apply str)
    (str/upper-case)))
