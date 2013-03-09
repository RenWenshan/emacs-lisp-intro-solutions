;;; ch11.el --- Solutions to the exercises in chapter 11 of the `An Introduction
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


;; Chapter 11: Looping
;; ===================

;; Exercise 1
;; ----------
;;
;; Question:
;; Write a function similar to `triangle' in which each row has a value which is
;; the square of the row number.  Use a `while' loop.
;;
;; Solution:
(defun wenshan-triangle (number-of-rows)
  "triangle in which each row has a value which is the square of
the row number"
  (let ((total 0)
        (row-number 1))
    (while (<= row-number number-of-rows)
      (setq total (+ total (* row-number row-number)))
      (setq row-number (1+ row-number)))
    total))


;; Exercise 2
;; ----------
;;
;; Question:
;; Write a function similar to `triangle' that multiplies instead of adds the
;; values.
;;
;; Solution:
(defun wenshan-triangle-mul (number-of-rows)
  "triangle that multiplies instead of adds the values"
  (let ((total 1)
        (row-number 1))
    (while (<= row-number number-of-rows)
      (setq total (* total row-number))
      (setq row-number (1+ row-number)))
    total))


;; Exercise 3
;; ----------
;;
;; Question:
;; Rewrite these two functions recursively.  Rewrite these functions using
;; `cond'.
;;
;; Solution:

;; recursive version of exercise 1
(defun wenshan-triangle-init (number-of-rows)
  "triangle in which each row has a value which is the square of
the row number using `cond'"
  (wenshan-triangle-helper 0 1 number-of-rows))

(defun wenshan-triangle-helper (sum counter number-of-rows)
  (cond ((> counter number-of-rows) sum)
        ((<= counter number-of-rows)
         (wenshan-triangle-helper (+ sum (* counter counter))
                                  (1+ counter)
                                  number-of-rows))))

;; recursive version of exercise 2
(defun wenshan-triangle-mul-init (number-of-rows)
  "triangle that multiplies instead of adds the values"
  (wenshan-triangle-mul-helper 1 1 number-of-rows))

(defun wenshan-triangle-mul-helper (product counter number-of-rows)
  (cond ((> counter number-of-rows) product)
        ((<= counter number-of-rows)
         (wenshan-triangle-mul-helper (* product counter)
                                      (1+ counter)
                                      number-of-rows))))


;; Exercise 4
;; ----------
;;
;; Question:
;; Write a function for Texinfo mode that creates an index entry at the
;; beginning of a paragraph for every `@dfn' within the paragraph.  (In a
;; Texinfo file, `@dfn' marks a definition.  This book is written in Texinfo.)
;;
;; (dirty) Solution:
(defun wenshan-create-index-for-dfn ()
  "Create an index entry at the beginning of the paragraph for every `@dfn'."
  (interactive)
  (save-excursion
    ;; mark-paragraph puts the point at the beginning of the paragraph
    (mark-paragraph)
    (save-restriction
      (narrow-to-region (point) (mark))
      ;; create an dfn list
      (setq dfn-list '())

      (while (search-forward-regexp "@dfn{.+?}" nil t)
        (let ((end (point))
              (start (search-backward "@")))
          (setq dfn-list (cons (buffer-substring start end) dfn-list)))
        (search-forward-regexp "@dfn{.+?}") nil t)

      ;; insert each dfn
      (while (> (length dfn-list) 0)
        ;; go back to the beginning of the paragraph
        (forward-paragraph -1)
        (insert (concat (car dfn-list) "\n"))
        (setq dfn-list (cdr dfn-list))))))
