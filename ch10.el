;;; ch10.el --- Solutions to the exercises in chapter 10 of the `An Introduction
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


;; Chapter 10: Yanking Text Back
;; =============================

;; Exercise 1
;; ----------
;;
;; Question:
;; Using `C-h v' (`describe-variable'), look at the value of your kill ring.
;; Add several items to your kill ring; look at its value again.  Using `M-y'
;; (`yank-pop)', move all the way around the kill ring.  How many items were in
;; your kill ring?  Find the value of `kill-ring-max'.  Was your kill ring full,
;; or could you have kept more blocks of text within it?
;;
;; Solution:

;; find the value of `kill-ring-max'
kill-ring-max

;; test whether the kill ring is full or not
(= kill-ring-max (length kill-ring))

;; keep more blocks of text in the kill ring
(setq kill-ring-max 100)


;; Exercise 2
;; ----------
;;
;; Question:
;; Using `nthcdr' and `car', construct a series of expressions to return the
;; first, second, third, and fourth elements of a list.
;;
;; Solution:

;; construct a list
(setq wenshan-test-list '("Hello" "World" "Emacs" "Rocks"))

;; return the first element
(car wenshan-test-list)

;; return the second element
(car (nthcdr 1 wenshan-test-list))

;; return the third element
(car (nthcdr 2 wenshan-test-list))

;; return the fourth element
(car (nthcdr 3 wenshan-test-list))
