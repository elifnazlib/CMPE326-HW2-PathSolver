# CMPE 326 Concepts of Programming Languages

## Homework 2 - Path Solver

### Problem

In this assignment, you are going to write a **Scheme** program that finds the correct movements in a path. Figure 1 shows an example path, which has a grid layout. In the grid, black cells are simply walls, which are basically obstacles for you. You can move among the white cells and <ins>you cannot pass the boundaries of the grid</ins>. In each path, <ins>the starting location will be the square of [0,0]</ins>. Additionally, there is also one white cell labeled with F. This label shows the finish square of the path. So, your aim is to find the movements from the starting location to the finish location. To this end, you can move in 4 directions; up, down, left, right. These 4 directions will be represented by characters U, D, L, and R, respectively.

<br>

<kbd> <img width="300" alt="figure1" src="https://github.com/user-attachments/assets/8335f598-f4ab-4a2f-a0a6-0368055e068a">  </kbd>

<br>
<br>

The solution for the path shown in Figure 1 is ```"D D R R R R D D"```, which means move down 2 times, then
move right 4 times and move down 2 times. <ins>The path is not a maze!</ins> It is a <ins>simple</ins> one way road and it
has only one solution: <ins>there is always one possible next square for each move</ins>.

<br>

### Environment Setup

You will use the `Racket Scheme interpreter` for this homework. Please do the following:

1. Download and install the Racket application from the link: https://download.racket-lang.org/

2. Open the Racket program and set the language to “The Racket Language” following the
Language -> Choose Language from the menu as shown below:

<kbd> ![image](https://github.com/user-attachments/assets/ad852af8-ce20-432f-9020-c3f62323a972) </kbd>

3. In order to set the Scheme interpreter, you have to write _#lang scheme_ at the beginning of every file:

<kbd> <img width="300" alt="image1" src="https://github.com/user-attachments/assets/e368e5d3-9cd4-4c9f-b0ef-2bb4c5896bad"> </kbd>

<br>
<br>

You are ready to write Scheme programs. You can evaluate your code with the "Run" button on the top right.

<kbd> ![image](https://github.com/user-attachments/assets/f8f4b297-4d06-4fdf-b2b0-4a404b0cb39a) </kbd>

<br>

Try writing ```(display "test")``` and press the Run button to see the result.

<kbd> <img width="300" alt="image2" src="https://github.com/user-attachments/assets/da3079e7-72f8-40c8-aa9a-6159a704c346"> </kbd>

<br>

### Tasks

In Scheme, a path will be represented in the form of a **linked-list**. Figure 2 shows how the path in Figure 1 is represented in terms of a linked list in Scheme. Starting cell [0,0] has the letter S, the finishing cell has the letter F and empty cells have the letter E. The walls have the letter - (minus).

<kbd> <img width="406" alt="image" src="https://github.com/user-attachments/assets/d8e49cb4-41ae-4bf5-a763-b79c338dbe0c"> </kbd>

<br>

The following function "buildPath" on the left is given for you which takes a list of lists and creates a path (grid) using the lists. You can use this function to create different paths in order to test your code. On the right the code shows how the path in Figure 2 is created.

<br>

**Scheme code for creating a path:**
```
(define (buildPath rows)
  (cond
    ((null? rows) null)
    (else (cons (buildPath (cdr rows))
                (car rows)))))
```

**Scheme code of the sample path in Figure 2:**
```
(define sample-path (buildPath
'(("S" "-" "-" "-" "-")
  ("E" "-" "-" "-" "-")
  ("E" "E" "E" "E" "E")
  ("-" "-" "-" "-" "E")
  ("-" "-" "-" "-" "F"))))
```

<br>
<br>

**Task 1:** Define two functions "getHeight" and "getWidth" which takes a path as an input and returns the height and the width of the path.

```
(getHeight sample-path) → should return 5

(getWidth sample-path) → should return 5
```

<br>
<br>

**Task 2:** Define a function "getLetter" which takes <ins>a path</ins>, <ins>a row number</ins> and <ins>a column number</ins>. Then it returns the letter from the path on the corresponding location [row, column]

```
(getLetter sample-path 0 0) → should return S

(getLetter sample-path 1 0) → should return E

(getLetter sample-path 1 1) → should return -

(getLetter sample-path 4 4) → should return F
```

<br>
<br>

**Task 3:** Define a function "solvePath" which takes a path and returns the solution for the path.

```
(solvePath sample-path) → should return (D D R R R R D D)
```

<br>
<br>

## Developers:
[Elif Nazlı Böke](https://github.com/elifnazlib) <br>
[Gülce Ayşe Döker](https://github.com/GulceAyseDoker)
