;;dense poly
(define (the-empty-termlist) '())
(define (empty-termlist? term-list) (null? term-list))

(define (make-term order coeff)
  (cons order coeff))
(define (order term)
  (car term))
(define (coeff term)
  (cdr term))
(define (first-coeff term-list)
  (car term-list))
(define (rest-coeffs term-list)
  (cdr term-list))
  
(define (add-terms l1 l2)
  (let ((len1 (length l1))
        (len2 (length l2)))
    (cond ((> len1 len2)
           (let ((result-pair (split-list (- len1 len2) l1)))
             (append (car result-pair)
                     (map add (cdr result-pair) l2))))
          ((< len1 len2)
           (let ((result-pair (split-list (- len2 len1) l2)))
             (append (car result-pair)
                     (map add l1 (cdr result-pair)))))
          (else
           (map add l1 l2)))))
(define (mul-terms l1 l2)
  (if (empty-termlist? l1)
      (the-empty-termlist)
      (add-terms (mul-term-by-terms (make-term (- (length l1) 1) (first-coeff l1))
                                    l2)
                 (mul-terms (rest-coeffs l1) l2))))
(define (mul-term-by-terms term terms)
  (append (map (lambda (x) (* x (coeff term))) terms)
          (build-list-from-num-val (order term) 0)))

(load "d:\\sicp\\chapter2\\split-list.ss")
(define (test-code)
  (define tl1 '(1 2 3 4))
  (define tl2 '(2 3 4 5))
  (define tl3 '(1 2 3))
  (display "test add-terms") (newline)
  (display (add-terms tl1 tl2)) (newline)
  (display (add-terms tl1 tl3)) (newline)
  (display (add-terms tl3 tl1)) (newline)
  (display (add-terms '() tl1)) (newline)
  (display (add-terms tl1 '())) (newline)
  (display "test mul-terms") (newline)
  (display (mul-terms tl1 tl2)) (newline)
  'test-done)
(define add +)
(test-code)