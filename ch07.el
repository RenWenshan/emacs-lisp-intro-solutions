;;; ch07.el --- Solutions to the exercises in chapter 07 of the `An Introduction
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


;; Chapter 7: `car', `cdr', `cons': Fundamental Functions
;; =================================

;; Exercise 1
;; ----------
;;
;; Question:
;; Construct a list of four birds by evaluating several expressions with `cons'.
;; Find out what happens when you `cons' a list onto itself.  Replace the first
;; element of the list of four birds with a fish.  Replace the rest of that list
;; with a list of other fish.
;;
;; Solution:

;; construct a list of four birds (in Chinese Pinyin :p)
(setq wenshan-birds (cons 'huamei
                          (cons 'bailing
                                '(shanque yingwu))))

;; `cons' a list onto itself
(cons wenshan-birds wenshan-birds)

;; replace the first element of the list
(setcar wenshan-birds 'liyu)

;; Evaluate the list to see the list of birds has changed:
wenshan-birds

;; replace the rest of the list with a list of other fish
(setcdr wenshan-birds '(lianyu heiyu jiyu))

;; Evaluate the list to see the list of birds has changed:
wenshan-birds
