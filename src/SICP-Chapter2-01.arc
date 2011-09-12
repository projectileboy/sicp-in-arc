;;;; SICP - Chapter 2.1


; Exercise 2.1

(def gcd (a b)
    (if (is b 0) a
        (gcd b (mod a b))))

(def make-rat (n d)
    (let (g (gcd n d))
        (cons (/ n g) (/ d g))))

; Make a better make-rat that can handle positive and negative integers by
; normalizing the sign (i.e., if n and d are negative, make them both positive)






; Exercise 2.2

; Define a constructor 'make-segment' and selectors 'start-segment' and 'end-segment'
; that define a representation of segments in terms of points. Furthermore, a point
; can be represented as a pair of numbers: x and y. Accordingly, specify a constructor
; 'make-point' and selectors 'x-point' and 'y-point'. Finally, define a procedure
; 'midpoint-segment'.

(def make-point (x y) (cons x y))
(def x-point (pt) (car pt))
(def y-point (pt) (cdr pt))

(def make-segment (a b) (cons a b))
(def start-segment (seg) (car seg))
(def end-segment (seg) (cdr seg))

(def midpoint-segment (seg)
    (let (coord-avg
            [/ (+ (_ (start-segment seg)) (_ (end-segment seg))) 2])
        (cons (coord-avg x-point)
              (coord-avg y-point))))



; Exercise 2.3




; Exercise 2.4




; Exercise 2.5

