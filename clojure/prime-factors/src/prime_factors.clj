(ns prime-factors)

(defn prime? [n]
  (let [r (int (Math/sqrt n))]
    (every? #(not= 0 (mod n %)) (range 5 (inc r)))))

(defn possible-primes [n]
  (lazy-seq (cons (dec n) (cons (inc n) (possible-primes (+ n 6))))))

(def primes
  (cons 2 (cons 3 (filter prime? (possible-primes 6)))))

(defn primes-up-to [n]
  (take-while #(<= % n) primes))

(defn of
  ([n] (of n [] (primes-up-to n)))
  ([n factors [prime & rest-primes] ]
   (cond
     (= 1 n) factors
     (nil? prime) factors
     (zero? (mod n prime)) (recur (/ n prime) (conj factors prime) (conj rest-primes prime))
     :else (recur n factors rest-primes))))
