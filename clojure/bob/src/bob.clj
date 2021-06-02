(ns bob
  (:require [clojure.string :refer [blank? ends-with? upper-case trim]]))

(defn- is-silence? [s] (blank? s))
(defn- is-question? [s] (ends-with? (trim s) "?"))
(defn- is-shout? [s] (and (= s (upper-case s)) (some #(Character/isLetter %) s)))

(defn response-for [s]
  (cond
    (is-silence? s) "Fine. Be that way!"
    (and (is-question? s) (is-shout? s)) "Calm down, I know what I'm doing!"
    (is-question? s) "Sure."
    (is-shout? s) "Whoa, chill out!"
    :else "Whatever."
    )
)
