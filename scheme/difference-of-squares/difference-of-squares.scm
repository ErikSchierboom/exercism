(import (rnrs))

(define (square n)
  (* n n))

(define (square-of-sum n)
  (square (apply + (iota n 1))))

(define (sum-of-squares n)
  (apply + (map square (iota n 1))))

(define (difference-of-squares n)
  (- (square-of-sum n) (sum-of-squares n)))
