(ns clock)

(defrecord Clock [minutes])

(defn clock->string [clock]
  (format "%02d:%02d" (quot (:minutes clock) 60) (mod (:minutes clock) 60)))

(defn clock [hours minutes]
  (Clock. (mod (+ (* 60 hours) minutes) (* 60 24))))

(defn add-time [clock time]
  (clock/clock 0 (+ (:minutes clock) time)))
