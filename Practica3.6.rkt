;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Practica3.6) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ANCHO 1280)
(define ALTO 720)
(define COLOR-CIELO "black")
(define FONDO (rectangle ANCHO ALTO "solid" COLOR-CIELO))
(define ESCALA-ESTR 50)
(define COLOR-ESTR "yellow")

(define (estrella t) (star t "solid" COLOR-ESTR))

(define (interpretar s) s)

(define (estrellar s x y event) (cond [(string=? event "button-down") (if (and
                                                                               (and (> x (+ 0 (* ESCALA-ESTR (/ x ANCHO)))) (< x (- ANCHO (* ESCALA-ESTR (/ x ANCHO)))))
                                                                               (and (> y (+ 0 (* ESCALA-ESTR (/ x ANCHO)))) (< y (- ALTO (* ESCALA-ESTR (/ x ANCHO)))))
                                                                               )  
                                                                         (place-image (estrella (* ESCALA-ESTR (/ x ANCHO))) x y s)
                                                                          s
                                                                          )
                                                                      ]
                                      [else s]
                                      )
  )
(define (manejar-teclado s k) (cond [(string=? k "\b" ) FONDO]
                                    [else s]
                                    )
  )

(big-bang FONDO                       ; estado inicial del sistema
          [to-draw       interpretar]
          [on-mouse        estrellar]
          [on-key    manejar-teclado]
  )