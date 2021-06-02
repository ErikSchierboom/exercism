(ns bob (:require [clojure.string :as str]))

(defn- is-silence? [s] (str/blank? s))
(defn- is-question? [s] (str/ends-with? (str/trim s) "?"))
(defn- is-shout? [s] (and (= s (str/upper-case s)) (some #(Character/isLetter %) s)))

(defn response-for [s]
  (cond
    (is-silence? s) "Fine. Be that way!"
    (and (is-question? s) (is-shout? s)) "Calm down, I know what I'm doing!"
    (is-question? s) "Sure."
    (is-shout? s) "Whoa, chill out!"
    :else "Whatever."
    )
)
