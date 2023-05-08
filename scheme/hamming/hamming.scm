(import (rnrs))

(define (hamming-distance strand-a strand-b)
  (length
    (filter
      (lambda (pair) (not (eqv? (car pair) (cdr pair))))
      (map cons (string->list strand-a) (string->list strand-b)))))
