;;; ch15.el --- Solutions to the exercises in chapter 15 of the `An Introduction
;;; to Programming in Emacs Lisp'

;; Copyright (C) 2013  Ren Wenshan

;; Author: Ren Wenshan <renws1990@gmail.com>
;; URL: https://github.com/RenWenshan/emacs-lisp-intro-solutions

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


;; Chapter 15: Readying a Graph
;; ============================

;; Exercise 1
;; ----------
;;
;; Question:
;; Write a line graph version of the graph printing functions.
;;
;; Solution:

(defvar wenshan-graph-symbol "*"
  "String used as symbol in graph, usually an asterisk.")

(defvar wenshan-graph-blank " "
  "String used as blank in graph, usually a blank
space. wenshan-graph-blank must be the same number of columns wide as
wenshan-graph-symbol")

(defun wenshan-column-of-graph (max-graph-height actual-height &optional line)
  "Return MAX-GRAPH-HEIGHT strings; ACTUAL-HEIGHT are graph-symbols.
The graph-symbols are contiguous entries at the end
of the list.
The list will be inserted as one column of a graph.
The strings are either wenshan-graph-blank or wenshan-graph-symbol.

The optional argument `line' will be used to determine whether to
draw bar graph or line graph. (By default, bar graph)"

  (let ((insert-list nil)
        (number-of-top-blanks
         (- max-graph-height actual-height)))

    (if line
        ;; line graph
        (progn
         ;; Fill in `wenshan-graph-blanks'.
         (while (> actual-height 1)
           (setq insert-list (cons wenshan-graph-blank insert-list))
           (setq actual-height (1- actual-height)))
         ;; Fill in `wenshan-graph-symbol'
         (setq insert-list (cons wenshan-graph-symbol insert-list)))

      ;; bar graph
      ;;Fill in `wenshan-graph-symbols'.
      (while (> actual-height 0)
        (setq insert-list (cons wenshan-graph-symbol insert-list))
        (setq actual-height (1- actual-height))))

    ;; Fill in `wenshan-graph-blanks'.
    (while (> number-of-top-blanks 0)
      (setq insert-list (cons wenshan-graph-blank insert-list))
      (setq number-of-top-blanks
            (1- number-of-top-blanks)))

    ;; Return whole list.
    insert-list))


(defun wenshan-graph-body-print (numbers-list &optional line)
  "Print a bar graph or line graph of the NUMBERS-LIST.
The numbers-list consists of the Y-axis values.

`line': if true, print line graph; if nil, print bar graph"

  (let ((height (apply 'max numbers-list))
        (symbol-width (length wenshan-graph-blank))
        from-position)

    (while numbers-list
      (setq from-position (point))
      (insert-rectangle
       (wenshan-column-of-graph height (car numbers-list) line))
      (goto-char from-position)
      (forward-char symbol-width)
      ;; Draw graph column by column.
      ;; (set-for 0) perform redisplay immediately
      (sit-for 0)
      (setq numbers-list (cdr numbers-list)))
    ;; Place point for X axis labels.
    (forward-line height)
    (insert "\n")
    ))


;; Recursive Version
(defun recursive-graph-body-print (numbers-list &optional line)
  "Print a bar graph or line graph of the NUMBERS-LIST.
The numbers-list consists of the Y-axis values.

`line': if true, print line graph; if nil, print bar graph"
  (let ((height (apply 'max numbers-list))
        (symbol-width (length wenshan-graph-blank))
        from-position)
    (recursive-graph-body-print-internal
     numbers-list
     height
     symbol-width
     line)))


(defun recursive-graph-body-print-internal
  (numbers-list height symbol-width &optional line)
  "Print a bar graph.
Used within recursive-graph-body-print function.

The optional argument `line' will be used to determine whether to
draw bar graph or line graph. (By default, bar graph)"

  (when numbers-list
    (setq from-position (point))
    (insert-rectangle
     (wenshan-column-of-graph height (car numbers-list) line))
    (goto-char from-position)
    (forward-char symbol-width)
    (sit-for 0)     ; Draw graph column by column.
    (recursive-graph-body-print-internal
     (cdr numbers-list) height symbol-width line)))

(wenshan-graph-body-print '(1 2 3 4 6 4 3 5 7 6 5 2 3) t)
