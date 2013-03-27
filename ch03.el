;;; ch03.el --- Solutions to the exercises in chapter 03 of the `An Introduction
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


;; Chapter 3: Practicing Evaluation
;; ================================

;; Exercise 1
;; ----------
;;
;; Question:
;; Write a non-interactive function that doubles the value of its argument, a
;; number.  Make that function interactive.
;;
;; Solution:
(defun wenshan-double-function (value)
  "Double VALUE."
  (* 2 value))

(defun wenshan-double-command (value)
  "Double VALUE."
  (interactive "p")
  (message "The result is %d" (* 2 value)))


;; Exercise 2
;; ----------
;;
;; Question:
;; Write a function that tests whether the current value of `fill-column' is
;; greater than the argument passed to the function, and if so, prints an
;; appropriate message.
;;
;; Solution:
(defun wenshan-greater-than-fill-column-p (number)
  "Test if the current value of `fill-column' is greater than NUMBER."
  (interactive "p")
  (if (> number fill-column)
      (message "%d is greater than `fill-column'" number)
    (message "%d is less than `fill-column'" number)))
