;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Practica3.2.1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 2

(define INI 10)
(define DIM 500)
(define ESCENA (empty-scene DIM DIM))

; interpretar : Number -> Image
; transforma el estado del sistema en una imagen a mostrar a través
; de la cláusula to-draw
(define
   (interpretar n)
   (place-image (circle  n "solid" (if (<= n 50) "yellow" (if (< n 100) "red" "green"))) (/ DIM 2) (/ DIM 2) ESCENA))

; decrementar : Number -> Number
; Devuelve el predecesor de un número positivo.
; Si el número es 0, devuelve 100. 
  (define (decrementar n) (if (> (abs n) 0) (- n 1) (+ n 1)))

  (define (oscilar n) (abs (* 50 (sin (* 1/50 pi (* 0.5 n))))))

; incrementar : Number -> Number
; suma uno a su argumento
 (define (incrementar n) (if (< (+ (* n 2) 1) DIM)
                             (+ n 1)
                              0))

(define (manejarTeclado n k) (if (not(boolean? (string->number k)))
                                 (* 10 (string->number k))
                                  n))
(define (termina? n) (or (< n 10) (> n 110)))

(big-bang INI                       ; estado inicial del sistema
          [to-draw   interpretar]
          [on-tick   incrementar]
          [on-key    manejarTeclado]
          [stop-when termina?])