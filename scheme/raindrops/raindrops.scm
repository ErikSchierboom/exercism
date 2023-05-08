(import (rnrs))

(define (convert number)
  (let* ([drops '((3 . "Pling") (5 . "Plang") (7 . "Plong"))]
         [sounds (filter (lambda (drop)
                         (zero? (modulo number (car drop)))) drops)])
    (if (null? sounds)
      (number->string number)
      (apply string-append (map cdr sounds)))))

