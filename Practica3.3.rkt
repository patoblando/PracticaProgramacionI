;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Practica3.3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ANCHO        1280)
(define ALTO         720)
(define INI         "yellow")
(define RAD          50.0)
(define COLOR-FONDO "white")


(define (interpretar n) (place-image
                         (circle RAD "solid" n)
                         (/ ANCHO 2) (/ ALTO 2)
                         (rectangle ANCHO ALTO "solid" COLOR-FONDO)
                         )
  )
(define (secuenciar n) (cond [(string=? n "yellow") "red"]
                            [(string=? n "red")    "green"]
                            [(string=? n "green")  "blue"]
                            [(string=? n "blue")   "yellow"]
                            )
  )

(big-bang INI                       ; estado inicial del sistema
          [to-draw   interpretar]
          [on-tick   secuenciar]
  )