(ns pascals-triangle)

(defn row [n] (reductions #(/ (*' %1 (- n %2)) %2) 1 (into [] (range 1 n))))
(defn rows [n] (lazy-seq (cons (row n) (rows (inc n)))))
(def triangle (rows 1))
