;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ejercicios-papel) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 2

; c)
(/ (* (sqrt (+ 1 24)) 5) (- 34 (sqr 3)))

; d)
(expt (expt 2 5) 1/3)

; e)
(define (3pow x) (expt x 1/3))
(- (3pow 8) (/ (- 4 (sqr 5)) (+ 7 0)))

; Ejercicio 3

; a)
(+ (string-length "Tiempos modernos") 1)

; b)
(string-append (substring "Buen año" 0 5) "comienzo de año")

; c)
