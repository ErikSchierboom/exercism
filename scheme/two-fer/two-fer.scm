(import (rnrs))

(define (two-fer . maybe-name)
  (let ([name (if (null? maybe-name) "you" (car maybe-name))])
    (string-append "One for " name ", one for me.")))
