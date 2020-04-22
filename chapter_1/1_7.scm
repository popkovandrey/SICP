#lang scheme

(define count 0)

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (square x) (* x x))

(define (old-good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (good-enough? prev-guess guess)
    (printf "~a ~a ~a ~a\n" count (- prev-guess guess) guess prev-guess)
    (set! count (+ count 1))
    (< (/ (abs (- guess prev-guess)) prev-guess) 0.000001))

(define (sqrt-iter guess x)
    (if (good-enough? guess (improve guess x))
        (printf "sqrt(~a) = ~a" x guess)
        (sqrt-iter (improve guess x) x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 123456789987654321)

