(ns clock
  (:require 
    [goog.string :as gstring]
    [goog.string.format]))

(defrecord Clock [minutes])

(defn clock->string [clock]
  (str (gstring/format "%02d" (quot (:minutes clock) 60)) ":" (gstring/format "%02d" (mod (:minutes clock) 60))))

(defn clock [hours minutes]
  (Clock. (mod (+ (* 60 hours) minutes) (* 60 24))))

(defn add-time [clock time]
  (clock/clock 0 (+ (:minutes clock) time)))
