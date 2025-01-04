(ns eliuds-eggs)

(defn egg-count [number]
  (->> number
       (iterate #(bit-shift-right % 1))
       (take-while pos?)
       (map #(bit-and % 1))
       (apply +)))
