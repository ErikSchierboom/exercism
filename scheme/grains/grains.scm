(import (rnrs))

(define (square n)
  (if
    (and (>= n 1) (<= n 64)) (expt 2 (- n 1))
    (error 'test "invalid square")))

(define total
  (- (expt 2 64) 1))
