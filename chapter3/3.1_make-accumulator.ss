(define (make-accumulator init)
  (lambda (amount)
    (set! init (+ init amount))
    init))
(define A (make-accumulator 5))
(A 10)
(A 10)
(A 5)