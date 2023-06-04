(import (rnrs))

(define (open->close char)
  (case char
    ((#\{) #\})
    ((#\() #\))
    ((#\[) #\])
    (else #f)))

(define (close->open char)
  (case char
    ((#\}) #\{)
    ((#\)) #\()
    ((#\]) #\[)
    (else #f)))

(define (balanced? string)
  (let loop ((chars (string->list string))
             (opened '()))
    (cond
      ((null? chars) (null? opened))
      ((open->close (car chars)) (loop (cdr chars) (cons (car chars) opened)))
      ((and (close->open (car chars)) (not (null? opened)) (char=? (close->open (car chars)) (car opened))) (loop (cdr chars) (cdr opened)))
      ((close->open (car chars)) #f)
      (else (loop (cdr chars) opened)))))
