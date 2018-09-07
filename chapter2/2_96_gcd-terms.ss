;;2.96
(load "d:\\sicp\\chapter2\\2_94_gcd-poly.ss")
(define (persudoremainder-terms a b)
  (let ((o1 (order (first-term a)))
        (o2 (order (first-term b)))
        (c (coeff (first-term b))))
    (remainder-terms (mul-term-by-terms (make-term 0 (expt c
                                                           (+ 1 o1 (- o2))))
                                        a)
                     b)))
(define (gcd-terms-helper a b)
  (if (empty-termlist? b)
      a
      (gcd-terms-helper b (persudoremainder-terms a b))))
(define (gcd-terms a b)
  (let ((res (gcd-terms-helper a b)))
    (let ((gcd_ (apply gcd res)))
      (map (lambda (x) (/ x gcd_)) res))))
(display (gcd-terms '(11 -22 18 -14 7) '(13 -21 3 5)))
;(gcd 3 6 9)
;;(1 -2 1)