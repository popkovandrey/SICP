#lang scheme

;; recursion
(define (f2 n)
    (if (< n 3)
        n
        (+ (f (- n 1)) (f (- n 2)) (f (- n 3)))))

;; iteration
(define (f n)
    (define (f-iter a b c count)
        (if (= count 2)
            a
            (f-iter (+ a b c) a b (- count 1))))
            
    (if (< n 3)
        n
        (f-iter 2 1 0 n)))

;; starting in a loop
(define (for start finish)
    (printf "~a~n" (f start))
    (if (< start finish) 
        (for (+ start 1) finish)
        (printf "It's all")))

(for 1 20)
