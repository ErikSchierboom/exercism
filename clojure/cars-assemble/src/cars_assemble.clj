(ns cars-assemble)

(def cars-per-hour 221)

(defn- success-rate [speed]
  (case speed
    0 0.0
    (1 2 3 4) 1.0
    (5 6 7 8) 0.9
    9 0.8
    10 0.77))

(defn production-rate [speed]
  (* cars-per-hour speed (success-rate speed)))

(defn working-items [speed]
  (int (/ (production-rate speed) 60)))
