(ns raindrops)

(defn- divisible-by? [n m] (zero? (mod n m)))

(defn convert [n]
  (cond-> nil
    (divisible-by? n 3) (str "Pling")
    (divisible-by? n 5) (str "Plang")
    (divisible-by? n 7) (str "Plong")
    :always             (or (str n))))
