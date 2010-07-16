(define (square x) (* x x))

(define (sqrt-iter guess x)
   (if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x) x)))

(define (improve guess x)
   (average guess (/ x guess)))

(define (average x y)
   (/ (+ x y) 2))

(define (good-enough? guess x)
   (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
   (sqrt-iter 1.0 x))

(define (puts x)
   (print x "\n"))

(define very-large-number 123456789012345678)
(define (very-large-number-squared) (square very-large-number))

(define very-small-number .00000002)
(define (very-small-number-squared) (square very-small-number))

; Number starts lower than precision necessary to be good enough so before
; you're anywhere near the right number it's already close enough
(puts (sqrt (very-small-number-squared)))
(puts very-small-number)

; The average between the guess and the number divided by the guess loses
; precision so it doesn't improve at a certain point.
(puts (sqrt (very-large-number-squared)))
(puts very-large-number)

(define (better-sqrt number)
   (define (good-enough? guess previous-guess)
      (< (abs (- previous-guess guess)) 0.001))
   (define (sqrt-iter guess previous-guess x)
      (if (good-enough? guess previous-guess)
         guess
         (sqrt-iter (improve guess x) guess x)))
   (sqrt-iter 1.0 0.0 number))

; This size number isn't possible with the previous one
(define very-very-large-number 12345678901234567890)
(define (very-very-large-number-squared) (square very-very-large-number))
(puts (better-sqrt (very-very-large-number-squared)))
(puts (better-sqrt (very-small-number-squared)))

; It seems to work better in general
