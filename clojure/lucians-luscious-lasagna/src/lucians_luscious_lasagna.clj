(ns lucians-luscious-lasagna)

(def expected-time 40) 

(defn remaining-time [actual-time]
  (- expected-time actual-time))

(defn prep-time [num-layers]
  (* 2 num-layers))

(defn total-time [num-layers actual-time]
  (+ (prep-time num-layers) actual-time))