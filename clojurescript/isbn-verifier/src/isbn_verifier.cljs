(ns isbn-verifier (:require [clojure.string :as str]))

(defn- valid-format? [isbn] (re-matches #"\d{9}[\dX]" isbn))

(defn- valid-checksum? [isbn]
  (let [digit-value (fn [digit] (if (= digit \X) 10 (js/parseInt digit 10)))
        indexed-value (fn [idx digit] (* (- 10 idx) (digit-value digit)))
        checksum (reduce + (map-indexed indexed-value isbn))]
    (zero? (mod checksum 11))))

(defn- normalize-isbn [isbn] (str/replace isbn "-" ""))

(defn isbn? [isbn]
  (let [isbn (normalize-isbn isbn)]
    (boolean (and (valid-format? isbn) (valid-checksum? isbn)))))
