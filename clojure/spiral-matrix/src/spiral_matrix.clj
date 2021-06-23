(ns spiral-matrix)

(defn spiral-value [size start-value row col]
  (cond
    (zero? row) (+ start-value col)
    (= col (dec size)) (+ start-value size row -1)
    (= row (dec size)) (+ start-value (* size 3) -3 (- col))
    (zero? col) (+ start-value (* size 4) -4 (- row))
    :else (recur (- size 2) (+ start-value (* size 4) -4) (dec row) (dec col))))

(defn spiral [n]
  (for [row (range 0 n)]
    (map #(spiral-value n 1 row %) (range 0 n))))
