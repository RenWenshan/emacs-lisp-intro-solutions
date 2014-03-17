;;; ch06.el --- Solutions to the exercises in chapter 06 of the `An Introduction
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


;; Chapter 6: Narrowing and Widening
;; =================================

;; Exercise 1
;; ----------
;;
;; Question:
;; Write a function that will display the first 60 characters of the
;; current buffer, even if you have narrowed the buffer to its latter half
;; so that the first line is inaccessible.  Restore point, mark, and
;; narrowing.  For this exercise, you need to use a whole potpourri of
;; functions, including `save-restriction', `widen', `goto-char',
;; `point-min', `message', and `buffer-substring'.

;; (`buffer-substring' is a previously unmentioned function you will
;; have to investigate yourself; or perhaps you will have to use
;; `buffer-substring-no-properties' or `filter-buffer-substring' ..., yet
;; other functions.  Text properties are a feature otherwise not discussed
;; here.  *Note Text Properties: (elisp)Text Properties.)

;; Additionally, do you really need `goto-char' or `point-min'?  Or can
;; you write the function without them?
;;
;; Solution:
(defun wenshan-display-first-60-chars ()
  "Display the first 60 characters of the current buffer."
  (interactive)
  (save-restriction
    (widen)
    (message (buffer-substring-no-properties 1 60))))
