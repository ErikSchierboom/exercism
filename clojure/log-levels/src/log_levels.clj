(ns log-levels
  (:require [clojure.string :as str]))

(defn message [s]
  (str/trim (last (str/split s #":"))))

(defn log-level [s]
  (str/lower-case (second (re-find #"^\[(.+)\]" s))))  

(defn reformat [s]
  (str (message s) " (" (log-level s) ")"))
