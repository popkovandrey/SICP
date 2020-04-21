#lang scheme

(define (square x)
    (* x x))

(define (sum-of-squares x y)
    (+ (square x) (square y)))

(define (>= x y)
    (not (< x y)))

(define (f x y z)
    (cond 
        ((and (>= x z) (>= y z)) (sum-of-squares x y))
        ((and (>= x y) (>= z y)) (sum-of-squares x z))
        ((and (>= y x) (>= z x)) (sum-of-squares y z))))

(f 4 3 2) ;25
(f 4 3 5) ;41
(f 4 6 5) ;61
