(ns phone-number (:require [clojure.string :as str]))

(defn number [num-string]
  (let [cleaned-up (str/replace num-string #"[^\d]" "")
        digits (second (re-matches #"1?(\d{10})" cleaned-up))]
    (or digits "0000000000")))

(defn area-code [num-string]
  (subs (number num-string) 0 3))

(defn exchange-code [num-string]
  (subs (number num-string) 3 6))

(defn subscriber-number [num-string]
  (subs (number num-string) 6))

(defn pretty-print [num-string]
  (str "(" (area-code num-string) ") " (exchange-code num-string) "-" (subscriber-number num-string)))
