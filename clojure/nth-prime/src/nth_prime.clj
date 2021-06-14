(ns nth-prime)

(defn prime? [n]
  (let [r (int (Math/sqrt n))]
    (every? #(not= 0 (mod n %)) (range 5 (inc r)))))

(defn possible-primes [n]
  (lazy-seq (cons (dec n) (cons (inc n) (possible-primes (+ n 6))))))

(def primes
  (cons 2 (cons 3 (filter prime? (possible-primes 6)))))

(defn nth-prime [n]
  (if (zero? n)
    (throw (IllegalArgumentException. "n must be positive"))
    (nth primes (dec n))))