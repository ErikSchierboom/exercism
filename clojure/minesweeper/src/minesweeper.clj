(ns minesweeper (:require [clojure.string :as str]))

(defrecord Board [cells])

(defn- parse-cell [c]
  (if (= \* c) :mine :empty))

(defn- parse-board [input]
  (->> input
       (str/split-lines)
       (mapv #(mapv parse-cell %))
       (->Board)))

(defn- cell-at [board row-idx col-idx]
  (nth (nth (:cells board) row-idx nil) col-idx nil))

(defn- neighboring-mines [board row-idx col-idx]
  (count
    (for [row-offset [-1 0 1]
          col-offset [-1 0 1]
          :let [cell (cell-at board (+ row-idx row-offset) (+ col-idx col-offset))]
          :when (= cell :mine)]
            cell)))

(defn- draw-cell [board row-idx col-idx cell]
  (cond
    (= cell :mine) \*
    :else
      (let [mine-count (neighboring-mines board row-idx col-idx)]
        (if (zero? mine-count) \ (str mine-count)))))

(defn- draw-row [board row-idx row]
  (apply str (map-indexed #(draw-cell board row-idx %1 %2) row)))

(defn draw [input]
  (let [board (parse-board input)]
    (str/join "\n" (map-indexed #(draw-row board %1 %2) (:cells board)))))
