(ns bob
  (:require [clojure.string :as str]))

(defn- silence? [s] (str/blank? s))
(defn- question? [s] (str/ends-with? (str/trim s) "?"))
(defn- shout? [s] (and (= s (str/upper-case s)) (not= s (str/lower-case s))))
(defn- shouted-question? [s] (and (question? s) (shout? s)))

(defn response-for [s]
  (condp apply [s]
    silence? "Fine. Be that way!"
    shouted-question? "Calm down, I know what I'm doing!"
    question? "Sure."
    shout? "Whoa, chill out!"
    "Whatever."))
