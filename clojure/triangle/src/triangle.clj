(ns triangle)

(defn is-valid? [x y z]
  (and (> (+ x y) z) (> (+ x z) y) (> (+ y z) x)))

(defn equilateral? [x y z]
  (and (is-valid? x y z) (= x y z)))

(defn isosceles? [x y z]
  (and (is-valid? x y z) (or (= x y) (= x z) (= y z))))

(defn scalene? [x y z]
  (and (is-valid? x y z) (not= x y) (not= y z)))
