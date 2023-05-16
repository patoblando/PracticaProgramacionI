;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Practica3.1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ejercicio 1

(define INI "blue")

; interpretar: Estado -> Image
; dado un estado, devuelve la imagen a mostrar por el programa
; (omitimos los ejemplos para faciltar la legibilidad)
(define
   (interpretar s)
   (place-image (circle 10 "solid" s) 100 100 (empty-scene 200 200)))

; manejarTeclado: Estado String -> Estado
(define (manejarTeclado s k) (cond [(key=? k "r") "red"]
                                   [(key=? k "b") "blue"]
                                   [(key=? k "g") "green"]
                                   [(key=? k " ") INI]
                                   [(key=? k "n") "black"]
                                   [else s]))

(big-bang INI                      ; estado inicial del sistema
 
          [to-draw interpretar]    ; dibuja en la pantalla 
                                   ; el círculo en el estado actual
 
          [on-key manejarTeclado]  ; cuando se presiona una tecla,
                                   ; la función manejarTeclado
                                   ; se invoca para manejar el evento
  )
