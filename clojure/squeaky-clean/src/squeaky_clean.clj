(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn remove-underscores [identifier]
  (str/replace identifier #" " "_"))

(defn replace-control-characters [identifier]
  (str/replace identifier #"\p{Cc}" "CTRL"))

(defn kebab-case-to-camel-case [identifier]
  (str/replace identifier #"-(.)" #(clojure.string/capitalize (%1 1))))

(defn letters-and-underscores-only [identifier]
  (str/replace identifier #"[^\p{L}_]", ""))

(defn omit-greek-letters [identifier]
  (str/replace identifier #"[\u03B1-\u03C9]" ""))

(defn clean
  "Clean an identifier"
  [identifier]
  (-> identifier
      remove-underscores
      replace-control-characters
      kebab-case-to-camel-case
      letters-and-underscores-only
      omit-greek-letters))
