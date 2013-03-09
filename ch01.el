;; ch01.el --- Solutions to the exercises in chapter 1 of the `An Introduction
;; to Programming in Emacs Lisp'

;; Copyright (C) 2013 Ren Wenshan

;; Author: Ren Wenshan <renws1990@gmail.com>
;; Keywords: Emacs Lisp
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


;; Chapter 1: List Processing
;; ==========================

;; Exercise 1
;; ----------
;;
;; Question:
;; Generate an error message by evaluating an appropriate symbol that is not
;; within parentheses.
;;
;; Solution: Mark the following expression, press `M-x eval-region', it gives an
;; error message: "Symbol's value as variable is void: +"
+


;; Exercise 2
;; ----------
;;
;; Question:
;; Generate an error message by evaluating an appropriate symbol that is between
;; parentheses.
;;
;; Solution: Mark the following expression, press `M-x eval-region', it gives an
;; error message: "Invalid function: 5"
(5)


;; Exercise 3
;; ----------
;;
;; Question: Create a counter that increments by two rather than one.
;;
;; Solution:
(setq counter 0)
(setq counter (+ counter 2))


;; Exercise 4
;; ----------
;;
;; Question:
;; Write an expression that prints a message in the echo area when evaluated.
;;
;; Solution:
(message "Hello Wenshan")
