(ns leap)

(defn divisible-by? [x y]
  (zero? (rem x y)))

(defn leap-year? [year]
  (and (divisible-by? year 4)
       (or (not (divisible-by? year 100))
           (divisible-by? year 400))))
