(ns go-counting (:require [clojure.set :as set]))

(defn- parse-stone [cell]
  (get {\B :black \W :white} cell :empty))

(defn- parse-board [grid]
  (let [coords (for [y (range (count grid))
                     x (range (count (first grid)))]
                 [y x])
        cells (map (fn [[x y]] (nth (nth grid y) x)) coords)
        stones (map parse-stone cells)]
    (zipmap coords stones)))

(defn- neighbor-coords [board [x y]]
  (let [offsets [[-1 0] [0 -1] [1 0] [0 1]]
        from-offset (fn [[dx dy]] [(- x dx) (- y dy)])]
    (->> offsets
         (map from-offset)
         (filter #(contains? board %)))))

(defn- territory-owner [stones]
  (when (= 1 (count stones))
    (first stones)))

(defn territory-coords
  ([board coord]
   (let [coord (coord-with-stone board coord)]
     (territory-coords board coord (set [coord]) (set [coord]) (set []))))
  ([board coord empty-coords processed-coords possible-owners]
  (if (nil? coord)
    {:stones empty-coords :owner (territory-owner possible-owners)}
    (let [neighbors (coord->neighbors board coord)
          empty-neighbors (get neighbors true)
          non-empty-neighbors (get neighbors false)
          new-owners (set/union possible-owners (set (map second non-empty-neighbors)))
          new-empty-coords (set/union empty-coords (set (map second empty-neighbors)))
          new-empty-coords (set/union empty-coords (set (map second empty-neighbors)))
          new-empty-neighbors (set/difference empty-neighbors checked-coords)
          new-coords (set/union checked-coords new-empty-neighbors)]
      (territory-coords board new-empty-neighbors new-coords)))))



(defn- empty-coords [board]
  (->> board
       (keep (fn [[k v]] (when (= :empty v) k)))
       set))

(defn territory [grid coord]
  (let [grid (parse-board grid)]
    (if (contains? grid coord)
      (let [coords (territory-coords grid (set [coord]) (set [coord]))]
        {:stones coords :owner (territory-owner grid coords)})
      (throw (IllegalArgumentException. "Invalid coordinate")))))

(defn territories [grid])


;let territoryOwner (board: Board) (coords: Set<Coord>) =
;let uniqueNeighborColors =
;coords
;|> Seq.collect (nonEmptyNeighborCoordinates board)
;|> Seq.choose (color board)
;|> set
;
;if uniqueNeighborColors.Count = 1 then Some (Seq.head uniqueNeighborColors)
;else None


;let territoryFor input coord =
;let board = mkBoard input
;let coords = territory board coord
;let owner = territoryOwner board coords
;
;if Set.isEmpty coords then None else Some (owner, Set.toList coords)
;
;let rec territoriesHelper board remainder acc =
;match remainder with
;| [] -> acc
;| coord :: _ ->
;let coords = territory board coord
;let owner = territoryOwner board coords
;let remainder = Set.difference (Set.ofList remainder) coords |> Set.toList
;
;territoriesHelper board remainder (Map.add owner (Set.toList coords) acc)
;
;let territories input =
;let board = mkBoard input
;let emptyCoords = emptyCoordinates board
;territoriesHelper board emptyCoords Map.empty