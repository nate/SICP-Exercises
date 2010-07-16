(define (puts x)
   (print x "\n"))

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (average x y)
   (/ (+ x y) 2))

(define (good-enough? guess previous-guess)
   (< (abs (- previous-guess guess)) 0.001))

(define (improve guess x)
   (/ (+ (/ x
            (square guess))
         (* 2 guess))
      3))

(define (cbrt-iter guess previous-guess x)
   (if (good-enough? guess previous-guess)
      guess
      (cbrt-iter (improve guess x) guess x)))

(define (cbrt x)
   (cbrt-iter 1.0 x))


(define very-large-number 123456789012345678)
(define (very-large-number-cubed) (cube very-large-number))

(define very-small-number .00000002)
(define (very-small-number-cubed) (cube very-small-number))

(puts (cbrt-iter 1.0 0.0 (very-large-number-cubed)))
(puts (cbrt-iter 1.0 0.0 (very-small-number-cubed)))
