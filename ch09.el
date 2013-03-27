;;; ch09.el --- Solutions to the exercises in chapter 09 of the `An Introduction
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


;; Chapter 9: How List are Implemented
;; ===================================

;; Exercise 1
;; ----------
;;
;; Question:
;; Set `flowers' to `violet' and `buttercup'.  Cons two more flowers on to this
;; list and set this new list to `more-flowers'.  Set the CAR of `flowers' to a
;; fish.  What does the `more-flowers' list now contain?
;;
;; Solution:

;; set `flowers' to `violet' and `buttercup'
(setq flowers '("violet" "buttercup"))

;; evaluate the list to see the list of flowers:
flowers

;; cons two more flowers on to this list
(setq more-flowers (cons "JuHua" (cons "KuiHua" flowers)))

;; evaluate the list to see the new list of flowers:
more-flowers

;; set the car of `flowers' to a fish
(setcar flowers "LiYu")

;; show the value of `more-flowers'
more-flowers
