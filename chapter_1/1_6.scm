#lang scheme

(define count 0)
(define a 0)
(define b 0)

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (square x) (* x x))

(define (good-enough? guess x)
    (printf "~a" count)
    (set! count (+ count 1)) 
    (printf "~a" " ")
    (printf "~a" (abs (- (square guess) x)))
    (printf "~n")
    (< (abs (- (square guess) x)) 0.001))


(define (new-if predicate then-clause else-clause)
    (cond 
        (predicate then-clause)
        (else else-clause )))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        (printf "sqrt(~a) = ~a" x guess)
        (sqrt-iter (improve guess x) x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

(sqrt 2234)

(printf "\nbefore execute \"if\" a=~a, b=~a \n" a b)
(if (= 5 4) (set! a 1) (set! b 2))
(printf "after execute \"if\" a=~a, b=~a \n" a b)
(printf "-----------------------\n")
(set! a 0)
(set! b 0)
(printf "before execute \"new-if\" a=~a, b=~a \n" a b)
(new-if (= 5 4) (set! a 1) (set! b 2))
(printf "after execute \"new-if\" a=~a, b=~a \n" a b)

; Вывод - при выполнении процедуры (define operator operand operand)
; сначала вычисляются все операнды, затем применяется оператор
; в нашем случае это приводило к зацикливанию - в new-if выполнялись все условия, 
; в том числе и рекурсивный запуск функции с новым ифом внутри