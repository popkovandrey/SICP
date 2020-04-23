#lang scheme

(define (triangleP row col)
    (cond 
        ((or (= col 1) (= col row)) 1)
        (else   (+ 
                    (triangleP (- row 1) (- col 1)) 
                    (triangleP (- row 1) col)
                )
        )
    )
)
 
(triangleP 5 1) 
(triangleP 5 2) 
(triangleP 5 3) 
(triangleP 5 4) 
(triangleP 5 5)
