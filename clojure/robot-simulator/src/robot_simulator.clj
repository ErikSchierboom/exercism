(ns robot-simulator)

(defrecord Robot [coordinates bearing])

(defn robot [coordinates bearing]
  (Robot. coordinates bearing))

(def turn-right
  { :north :east
    :east :south
    :south :west
    :west :north }) 

(def turn-left
  { :north :west
    :east  :north
    :south :east
    :west  :south })

(defn- simulate-instruction [robot instruction]
  (case instruction
    \L (assoc robot :bearing (turn-left (:bearing robot)))
    \R (assoc robot :bearing (turn-right (:bearing robot)))
    \A (case (:bearing robot)
         :north (assoc-in robot [:coordinates :y] (inc (get-in robot [:coordinates :y])))
         :east  (assoc-in robot [:coordinates :x] (inc (get-in robot [:coordinates :x])))
         :south (assoc-in robot [:coordinates :y] (dec (get-in robot [:coordinates :y])))
         :west  (assoc-in robot [:coordinates :x] (dec (get-in robot [:coordinates :x]))))
    robot))

(defn simulate [instructions robot]
  (reduce simulate-instruction robot instructions))
