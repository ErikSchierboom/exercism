(ns pythagorean-triplet)

(defn find-pythagorean-triplets
  "Given an integer N, it returns all Pythagorean triplets for which a + b + c = N"
  [N]
    (for [x (range 1 (quot N 3))
          y (range (inc x) (inc (quot (- N x) 2)))
          :let [z (- N y x)]
          :when (= (+ (* x x) (* y y)) (* z z))]
      [x y z])
  )
