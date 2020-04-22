#lang scheme

(define count 0)

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (/ (+ (/ x guess guess) (* 2 guess)) 3))

(define (square x) (* x x))

(define (good-enough? prev-guess guess)
    (printf "~a ~a ~a ~a\n" count (- prev-guess guess) guess prev-guess)
    (set! count (+ count 1))
    (< (abs (/ (- guess prev-guess) prev-guess)) 0.0001))

(define (cubrt-iter guess x)
    (if (good-enough? guess (improve guess x))
        (printf "sqrt(~a) = ~a" x guess)
        (cubrt-iter (improve guess x) x)))

(define (cubrt x)
    (cubrt-iter 1.0 x))

(cubrt -27)

