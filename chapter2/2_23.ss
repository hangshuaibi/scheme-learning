(define (for_each proc items)
  (define (comb items)
    (proc (car items))
    (for_each proc (cdr items)))
  (if (null? items)
      (display "")
      (comb items)))
;;test
(for_each (lambda (x) (newline) (display x))
          (list 1 2 3 4 5))