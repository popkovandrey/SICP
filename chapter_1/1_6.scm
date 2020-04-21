#lang scheme

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (square x) (* x x))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
    (cond 
        (predicate then-clause)
        (else else-clause)))

(define (new-if2 predicate then-clause else-clause)
    (if (predicate) then-clause else-clause))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 4)
(new-if2 (= 1 1) 1 0)