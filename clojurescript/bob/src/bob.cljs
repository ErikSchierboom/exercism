(ns bob (:require [clojure.string :as str]))

(defn- silence? [s] (str/blank? s))
(defn- question? [s] (str/ends-with? (str/trim s) "?"))
(defn- shout? [s] (and (= s (str/upper-case s)) (re-find #"[A-Za-z]" s)))

(defn response-for [s]
  (cond
    (silence? s) "Fine. Be that way!"
    (and (question? s) (shout? s)) "Calm down, I know what I'm doing!"
    (question? s) "Sure."
    (shout? s) "Whoa, chill out!"
    :else "Whatever."))