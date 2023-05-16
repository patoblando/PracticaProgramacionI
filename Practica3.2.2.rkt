;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Practica3.2.2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define ANCHO 1280)
(define ALTO  720)
(define INI   (/ ALTO 2))
(define DELTA (* 5 (/ 1280 720)))
(define RAD 50.0)

(define (interpretar n) (place-image (circle RAD "solid" "blue")
                                     (/ ANCHO 2) n
                                     (empty-scene ANCHO ALTO)
                                     )
  )

(define (manejarTeclado n k) (cond [(key=? k "up")   (if (not (< (- n (+ DELTA RAD)) 0))
                                                         (- n DELTA)
                                                         RAD
                                                         )
                                                     ]
                                   [(key=? k "down") (if (not (> (+ n (+ DELTA RAD)) ALTO))
                                                         (+ n DELTA)
                                                         (- ALTO RAD)
                                                         )
                                                     ]
                                   [(key=? k " ") INI]
                                   [else n]
                                   )
  )

(define (mouse-handler n x y event) (cond [(string=? event "button-down")
                                           (cond
                                             [(> (+ y RAD) ALTO) (- ALTO RAD)]
                                             [(< (- y RAD) 0)    RAD]
                                             [else y])]
                                          [else n]
                                          )
  )

(big-bang INI                       ; estado inicial del sistema
          [to-draw   interpretar]
          [on-mouse mouse-handler]
          [on-key    manejarTeclado])
         ; [stop-when termina?])