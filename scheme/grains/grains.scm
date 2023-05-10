(import (rnrs))

(define (square n)
  (if (<= 1 n 64)
    (expt 2 (- n 1))
    (error "n must be >= 1 and <= 64")))

(define total
  (- (expt 2 64) 1))
