(ns sieve)

(defn- cross-multiples [upper-limit idx candidates]
  (let [multiples (range (* 2 idx) (inc upper-limit) idx)]
    (reduce #(assoc %1 %2 false) candidates multiples)))

(defn sieve
  ([upper-limit]
    (sieve upper-limit 2 [] (into [] (repeat (inc upper-limit) true))))
  ([upper-limit idx primes candidates]
    (case (nth candidates idx nil)
      nil primes
      true (recur upper-limit (inc idx) (conj primes idx) (cross-multiples upper-limit idx candidates))
      false (recur upper-limit (inc idx) primes candidates))))
