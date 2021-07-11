(ns go-counting (:require [clojure.set :as set]))

(defn- parse-stone [cell]
  (get {\B :black \W :white} cell :empty))

(defn- parse-board [grid]
  (let [coords (for [y (range (count grid))
                     x (range (count (first grid)))]
                 [x y])
        cells (map (fn [[x y]] (nth (nth grid y) x)) coords)
        stones (map parse-stone cells)]
    (zipmap coords stones)))

(defn- neighbor-coords [board [x y]]
  (let [from-offset (fn [[dx dy]] [(- x dx) (- y dy)])
        offsets (map from-offset [[-1 0] [0 -1] [1 0] [0 1]])]
    (filter #(contains? board %) offsets)))

(defn- owner [owners]
  (when (= 1 (count owners))
    (first owners)))

(defn board-territory
  ([board coord]
   (condp = (get board coord)
     nil (throw (IllegalArgumentException. "Invalid coordinate"))
     :empty (board-territory board (set [coord]) (set [coord]) (set [coord]) (set []))
     (board-territory board (set []) (set []) (set []) (set []))))
  ([board unchecked-coords checked-coords empty-coords owners]
   (if (empty? unchecked-coords)
     {:stones empty-coords :owner (owner owners)}
     (let [neighbors-unchecked-coords (set (mapcat #(neighbor-coords board %) unchecked-coords))
           empty-neighbors (set (filter #(= :empty (get board %)) neighbors-unchecked-coords))
           owner-neighbors (set (filter #(not= :empty (get board %)) neighbors-unchecked-coords))
           new-checked-coords (set/union checked-coords neighbors-unchecked-coords)
           new-empty-coords (set/union empty-coords empty-neighbors)
           new-owners (set/union owners (set (map #(get board %) owner-neighbors)))
           new-unchecked-coords (set/difference empty-neighbors checked-coords)]
       (board-territory board new-unchecked-coords new-checked-coords new-empty-coords new-owners)))))

(defn- empty-coords [board]
  (->> board
       (keep (fn [[k v]] (when (= :empty v) k)))
       set))

(defn board-territories
  ([board]
    (board-territories board (empty-coords board) {:black-territory #{} :white-territory #{} :null-territory  #{}}))
  ([board unchecked-empty-coords acc]
   (if
     (empty? unchecked-empty-coords) acc
     (let [coord (first unchecked-empty-coords)
           terr (board-territory board coord)
           new-unchecked-empty-coords (set/difference unchecked-empty-coords (:stones terr))
           territory-key (case (:owner terr)
                           :black :black-territory
                           :white :white-territory
                           :null-territory)
           new-acc (merge-with set/union acc {territory-key (:stones terr)})]
       (board-territories board new-unchecked-empty-coords new-acc)))))

(defn territory [grid coord]
  (board-territory (parse-board grid) coord))

(defn territories [grid]
  (board-territories (parse-board grid)))
