(ns matrix
  (:require [clojure.string :as str]))

(defn- transpose [m] (apply mapv vector m))

(defn- parse-row [row] (mapv #(Integer/parseInt %) (str/split row #"\s")))

(defn- parse [s]  (mapv parse-row (str/split-lines s)))

(defn get-row [s i]
  (-> s
      (parse)
      (get (dec i))))

(defn get-column [s i]
  (-> s
      (parse)
      (transpose)
      (get (dec i))))
