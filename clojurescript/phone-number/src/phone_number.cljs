(ns phone-number (:require [clojure.string :as str]))

(defn cleanup-number [num-string]
  (str/replace (str/replace num-string #"[^\d]" "") #"^1" ""))

(defn number [num-string]
  (let [cleaned-up (cleanup-number num-string)
        valid-number? (re-matches #"1?[2-9]\d{2}[2-9]\d{2}\d{4}" cleaned-up)]
    (if valid-number? cleaned-up "0000000000")))

(defn area-code [num-string]
  (subs (cleanup-number num-string) 0 3))

(defn exchange-code [num-string]
  (subs (cleanup-number num-string) 3 6))

(defn subscriber-number [num-string]
  (subs (cleanup-number num-string) 6))

(defn pretty-print [num-string]
  (str "(" (area-code num-string) ") " (exchange-code num-string) "-" (subscriber-number num-string)))