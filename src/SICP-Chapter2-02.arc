;;;; SICP - Chapter 2.2


; Exercise 2.17

; Define a procedure 'last-pair' that returns the list that contains
; only the last element of a given (nonempty) list
;
; > (last-pair (list 23 72 149 34))
; (34)


; We could use the Arc library function 'last':
(def last-pair (l)
    (list (last l)))

; ... but that's sort of cheating. So let's do it without 'last':
(def last-pair (l)
    (if (< (len l) 2) l
        (last-pair (cdr l))))



; Exercise 2.18

; Define a procedure 'reverse' that takes a list as argument
; and returns a list of the same elements in reverse order
;
; > (reverse (list 1 4 9 16 25))
; (25 16 9 4 1))

(def last (l)
    (if (< (len l) 2) (car l)
        (last (cdr l))))

(def clipped (l)
    (if (< (len l) 2) '()
        (cons (car l) (clipped (cdr l)))))

(def reverse (l)
    (if (< (len l) 2) (cons (car l) '())
        (cons (last l) (reverse (clipped l)))))



; Exercise 2.19

; We'd like a change counting program (like the one from section 1.2.2) that can
; handle diferent currencies.





; Exercise 2.20

; Write a procedure 'same-parity' that takes one or more integers and returns a list
; of all the arguments that have the same even-odd parity as the first argument
;
; > (same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)
;
; > (same-parity 2 3 4 5 6 7)
;(2 4 6)

(def parity (x)
    (if (odd x) odd even))

(def same-parity l
    (if (l) (cons (car l) ???????)
        '()))



; Exercise 2.21

; The procedure 'square-list' takes a list and returns s list of the squares:
;
; > (square-list (list 1 2 3 4)
; (1 4 9 16)

; Complete these two definitions:

(def sq (x) (* x x))

(def square-list (l)
    (if (l) (cons ???? ????)
        '()))

(def square-list (l)
    (map [sq _] l))



; Exercise 2.22

; We could try defining 'square-list' like this...

(def square-list (l)
    )


; Exercise 2.23



; Exercise 2.24
; Exercise 2.25
; Exercise 2.26
; Exercise 2.27
; Exercise 2.28
; Exercise 2.29



; Exercise 2.30

; Define a procedure 'square-tree' analogous to 'square-list'


; Exercise 2.31
; Exercise 2.32
; Exercise 2.33
; Exercise 2.34
; Exercise 2.35
; Exercise 2.36
; Exercise 2.37
; Exercise 2.38
; Exercise 2.39

; Exercise 2.40
; Exercise 2.41
; Exercise 2.42
; Exercise 2.43
; Exercise 2.44
; Exercise 2.45
; Exercise 2.46
; Exercise 2.47
; Exercise 2.48
; Exercise 2.49

; Exercise 2.50
; Exercise 2.51
; Exercise 2.52