(define (sum-of-largest-two-squared a b c)
        (define (square x) (* x x))
        (define (smallest-squared) (cond ((and (< a b) (< a c)) (square a))
                                       ((and (< b a) (< b c)) (square b))
                                       (else                  (square c))))
        (define (all-squared) (+ (square a) (square b) (square c)))
        (- (all-squared) (smallest-squared)))

(print (sum-of-largest-two-squared 1 2 3))
