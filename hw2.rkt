#lang scheme

; This function builds a path from a list of lists, where each sublist represents a row in the path
(define (buildPath rows)
  (cond
    ((null? rows) null)  ; It returns null if the input list is empty, which indicates the end of recursion
    (else (cons (car rows) (buildPath (cdr rows)))))  ; It recursively builds the path by adding the first row with the rest
  )

; The sample path represented as a list of lists,
; which is built using the buildPath function.
(define sample-path
  (buildPath
   '(("S" "-" "-" "-" "-")
     ("E" "-" "-" "-" "-")
     ("E" "E" "E" "E" "E")
     ("-" "-" "-" "-" "E")
     ("-" "-" "-" "-" "F"))))

; This function takes a path and returns the height of the path
; which is the number of rows in this path using the length function.
(define (getHeight path)
  (length path))

; This function checks that if the path is empty, it returns 0. Else, it
; returns the width of the path which is the number of elements in the first row.
(define (getWidth path)
  (if (null? path)
      0
      (length (car path))))

; This function first checks if row and column numbers are out of bounds.
; If it's not, it returns the specified column from the selected row.
(define (getLetter path row col)
  (if (or (< row 0) (>= row (getHeight path)) (< col 0) (>= col (getWidth path)))
      "-"
      (list-ref (list-ref path row) col)))

; This function solves the path from start (S) to finish (F) using a recursive approach.
(define (solvePath path)
  (define (valid-move? row col visited)
    (and (not (member (list row col) visited))  ; It checks if the position is visited or not
         (not (string=? (getLetter path row col) "-"))))  ; It ensures that the position isn't a wall

  (let rec ((row 0) (col 0) (directions '()) (visited '()))  ; Recursive function which starts from (0,0)
    (cond
      ((string=? (getLetter path row col) "F") (reverse directions))  ; It returns the path when reaching the finish
      (else
       (let ((new-visited (cons (list row col) visited)))  ; It marks the current cell as visited
         (cond
           ((valid-move? (+ row 1) col new-visited) (rec (+ row 1) col (cons 'D directions) new-visited))  ; It moves down if possible
           ((valid-move? row (+ col 1) new-visited) (rec row (+ col 1) (cons 'R directions) new-visited))  ; It moves right if possible
           ((valid-move? (- row 1) col new-visited) (rec (- row 1) col (cons 'U directions) new-visited))  ; It moves up if possible
           ((valid-move? row (- col 1) new-visited) (rec row (- col 1) (cons 'L directions) new-visited))  ; It moves left if possible
           (else 'NoPath)))))))  ; It returns NoPath if there is no possible move

; Sample outputs
(getHeight sample-path) ; should return 5
(getWidth sample-path) ; should return 5
(getLetter sample-path 0 0) ; should return S
(getLetter sample-path 1 0) ; should return E
(getLetter sample-path 1 1) ; should return -
(getLetter sample-path 4 4) ; should return F
(solvePath sample-path) ; should return (D D R R R R D D)