;;; ch05.el --- Solutions to the exercises in chapter 05 of the `An Introduction
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


;; Chapter 5: A Few More Complex Functions
;; =======================================

;; Exercise 1
;; ----------
;;
;; Question:
;; Write an interactive function with an optional argument that tests whether
;; its argument, a number, is greater than or equal to, or else, less than the
;; value of `fill-column', and tells you which, in a message.  However, if you
;; do not pass an argument to the function, use 56 as a default value.
;;
;; Solution: press "C-u NUM M-x wenshan-compare-with-fill-column"
(defun wenshan-compare-with-fill-column (&optional num)
  (interactive "P")
  (if (>= (or (prefix-numeric-value num)
              56)
          fill-column)
      (message
       "Your argument is greater than or eqaul to the value of `fill-column'")
    (message "Your argument is less than the vlaue of `fill-column'")))
