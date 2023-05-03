(import (rnrs))

(define (divisible-by? x y)
  (= 0 (euclidean-remainder x y)))

(define (leap-year? year)
  (and (divisible-by? year 4)
       (or (not (divisible-by? year 100))
           (divisible-by? year 400))))
