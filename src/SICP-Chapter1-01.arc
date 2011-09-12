;; SICP - Chapter 1 - Section 1.1


; --- NOTES HERE ---


; Exercise 1.1
; What is the result printed by the interpreter in response to each expression?
;
10
; 10

(+ 5 3 4)
; 12

(- 9 1)
; 8

(/ 6 2)
; 3

(+ (* 2 4) (- 4 6))
; 6

(= a 3)
; 3

(= b (+ a 1))
; 4

(+ a b (* a b))
; 19

(is a b)
; nil

(if (and (> b a) (< b (* a b)))
    b
    a)
; 4

(if (is a 4) 6
    (is b 4) (+ 6 7 a)
    25)
; 6



; Exercise 1.2
; Translate the following expression into prefix form:
;      4 + 5 + 2 - (3 - (6 + (4 / 5)))  /  3 * (6 - 2)  * (2 - 7)
;
(/ (+ 4 5 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))
; - 37/150                PG's Arc behaves like a true Lisp...
; -0.24666666666666667      ...whereas Jarc does the Java thing and floats it.



; Exercise 1.3
; Define a procedure that takes three numbers as arguments
;  and returns the sum of the squares of the two larger numbers.
;

(def sum-list (args)
    (let x 0
        (do (while (car args)
                (= x (+ x (car args)))
                (= args (cdr args)))
            x)))

(def sum-big-squares args
    (sum-list (map [* _ _] (cdr (sort < args)))))


; Just for giggles, here would be a decent Arc implementation:
(def sum-big-squares args
    (apply + (map [* _ _] (cdr (sort < args)))))



; Exercise 1.4
(def a-plus-abs-b (a b)
    ((if (> b 0) + -) a b))
; arc> (a-plus-abs-b 12 12)
; 24
; arc> (a-plus-abs-b 12 -12)
; 24

; a-plus-abs-b can pick which operation to perform on a and b depending on the value of b!


; Exercise 1.5
(def p () p)

(def test (x y)
    (if (is x 0) 0 y))

(test 0 (p))

; What behavior is observed?
;arc> (test 0 (p))
;0
;
; => The infinite loop doesn't happen,
;     because we never get past the if test,
;      because we do NOT have applicative-order evaluation



; Exercise 1.6

(def sum (nums)
    (let x 0 (each n nums
                (= x (+ x n))) x))

(def average nums
    (/ (sum nums) (len sum)))

(def improve (guess x)
    (average guess x))

(def good-enough? (guess x (o delta 0.0001))
    (if (> delta (abs (- x (* guess guess))))))

(def sqrt (x)
    (if (good-enough? guess x) guess
        (sqrt (improve guess x) x)))




		; First, Newton's method for approximating square roots...

		(define (sqrt x)
		  (define (sqrt-iter guess x)
		    (if (good-enough? guess x) guess
		        (sqrt-iter (improve guess x) x)))
		  (define (improve guess x)
		    (average guess (/ x guess)))
		  (define (average x y)
		    (/ (+ x y) 2.0))
		  (define (good-enough? guess x)
		    (< (abs (- (square guess) x)) 0.0001))
		  (define (square x)
		    (* x x))

		  (sqrt-iter 1.0 x))



		; ...and now, another version with a modified "if"...
		(define (new-sqrt x)

		  (define (new-if predicate then-clause else-clause)
		    (cond (predicate then-clause)
		          (else else-clause)))

		  (define (sqrt-iter guess x)
		    ; This causes an infinite loop, because Lisp uses applicative-order evaluation
		    ; when evaluating procedures, whereas the built-in "if" procedure uses lazy evaluation.
		    ; Thus, when we try to execute new-if, we *always* attempt to evaluate sqrt-iter
		    ; before we can ever return the value from "good-enough?". And there's our infinite loop.
		    (new-if (good-enough? guess x) guess
		        (sqrt-iter (improve guess x) x)))

		  (define (improve guess x)
		    (average guess (/ x guess)))
		  (define (average x y)
		    (/ (+ x y) 2.0))
		  (define (good-enough? guess x)
		    (< (abs (- (square guess) x)) 0.0001))
		  (define (square x)
		    (* x x))

		  (sqrt-iter 1.0 x))








; Exercise 1.7

; Newton's method for approximating square roots...

(define (sqrt x)
  (define (sqrt-iter guess)
    (if (good-enough? guess) guess
        (sqrt-iter (improve guess))))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (average a b)
    (/ (+ a b) 2.0))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0001))
  (define (square y)
    (* y y))

  (sqrt-iter 1.0))


; Why will our program not work for very small or very large numbers?
; For small numbers we lose accuracy; for large numbers we lose precision.
; In both cases, the underlying cause is how floating point numbers
; are represented in the hardware.


; By modifying the "good-enough?" procedure to look for changes in
; the delta (rather than the delta itself), we get better answers.
(define (better-sqrt x)

  (define (sqrt-iter guess previous)
    (if (good-enough? guess previous) guess
        (sqrt-iter (improve guess) guess)))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (average a b)
    (/ (+ a b) 2.0))

  ; Improved - Just look for convergence
  (define (good-enough? current-guess previous-guess)
    (< (abs (- current-guess previous-guess)) 0.00001))

  (sqrt-iter 1.0 0))






; Exercise 1.8

(def cube-root (x)

  (def cube-root-iter (guess previous)
    (if (good-enough? guess previous) guess
        (cube-root-iter (improve guess) guess)))

  (def cube (y) (* y y y))
  (def square (y) (* y y))

  (def improve (guess)
    (/ (+ (/ x (square guess)) (* 2.0 guess)) 3.0))

  ; Improved - Just look for convergence
  (def good-enough? (current-guess previous-guess)
    (< (abs (- current-guess previous-guess)) 0.00001))


  (cube-root-iter 1.0 0))

