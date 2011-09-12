;; SICP - Chapter 1 - Section 1.3



; Exercise 1.29
; Use Simpson's Rule to perform numerical integration of x^3 from 0 to 1

(def integrate (f a b n)
    (let h (/ (- b a) n)
        (int-iter f a b n h
            (f (+ a (* n h))))))


(def int-iter (f a b n h acc)
    (if (is n 0) (+ (f a) acc)
        (int-iter f a b (dec n) h
            (+ acc (f (+ a (* n h)))))))




; Exercise 1.30


; Exercise 1.31
; Write a higher-order procedure called 'product' that returns the product of the values
; of a function at points over a given range. Show how to define 'factorial' in terms of
; 'product'. Also compute an approximation to pi / 4. Create both iterative and recursive
; implementations of 'product'.

(def product (term next a b)
    (if (> a b) 1
        (* (term a)
           (product term next (next a) b))))

(def factorial (n)
    (product (fn (x) x) [+ _ 1] 1 n))



; Exercise 1.32



; Exercise 1.33


; Exercise 1.34


; Exercise 1.35


; Exercise 1.36


; Exercise 1.37


; Exercise 1.38


; Exercise 1.39


; Exercise 1.40


; Exercise 1.41


; Exercise 1.42


; Exercise 1.43


; Exercise 1.44


; Exercise 1.45


; Exercise 1.46




