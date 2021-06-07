(ns pangram
  (:require [clojure.set :as set]
            [clojure.string :as str]))

(defn pangram? [sentence]
  (set/subset? (set "abcdefghijklmnopqrstuvwxyz") (set (str/lower-case sentence))))
