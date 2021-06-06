(ns word-count (:require [clojure.string :as str]))

(defn word-count [sentence]
  (frequencies (re-seq #"\w+" (str/lower-case sentence))))
