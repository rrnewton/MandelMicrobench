

(define (mandel depth c)
  (let loop ((i 0) (z 0))
    (cond 
      [(= i depth)            i]
      [(>= (magnitude z) 2.0) i]
      [else (loop (add1 i) (+ (* z z) c))])))

(define (main)
  (mandel (* 5 1000 1000) 0.1+0.1i))


(define (mandel2 depth c)
  (let loop ((i 0) (z 0.0))
    (cond 
      [(fx= i depth)          i]
      [(>= (magnitude z) 2.0) i]
      [else (loop (fx1+ i) (cfl+ (cfl* z z) c))])))

(define (main2)
  (mandel2 (* 5 1000 1000) 0.1+0.1i))

;; On my laptop:
; > (time (main))
; (time (main))
;     122 collections
;     514 ms elapsed cpu time, including 21 ms collecting
;     517 ms elapsed real time, including 15 ms collecting
;     1040031072 bytes allocated, including 1031970112 bytes reclaimed