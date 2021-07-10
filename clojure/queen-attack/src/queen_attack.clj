(ns queen-attack (:require [clojure.string :as str]))

(def rows (range 8))
(def cols (range 8))

(defn- board-cell [queens row col]
  (condp = [row col]
    (:w queens) "W"
    (:b queens) "B"
    "_"))

(defn- board-row [queens row]
  (str (str/join " " (map #(board-cell queens row %) cols)) "\n"))

(defn board-string [queens]
  (apply str (map (partial board-row queens) rows)))

(defn can-attack [queens]
  (let [[white-row white-col] (:w queens)
        [black-row black-col] (:b queens)]
    (or
      (= white-row black-row)
      (= white-col black-col)
      (= (Math/abs^int (- white-row black-row)) (Math/abs^int (- white-col black-col))))))
