(ns eliuds-eggs)

(defn egg-count [number]
  (loop [n number
         count 0]
    (if (zero? n)
      count
      (recur (bit-shift-right n 1) (+ (bit-and n 1) count)))))
