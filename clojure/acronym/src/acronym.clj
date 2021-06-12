(ns acronym (:require [clojure.string :as str]))

(defn acronym [sentence]
  (let [words (re-seq #"[A-Z]+[a-z]*|[a-z]+" sentence)]
    (str/upper-case (apply str (map first words)))))


