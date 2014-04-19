;;; ch12.el --- Solutions to the exercises in chapter 12 of the `An Introduction
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


;; Chapter 12: Regular Expression Searches
;; =======================================

;; Exercise 1
;; ----------
;;
;; Question:
;; Write a function to search for a regular expression that matches two or more
;; blank lines in sequence.
;;
;; Solution:
(defun wenshan-search-for-blank-lines (arg)
  "Search for two or more blank lines in sequence."
  (interactive "p")
  (or arg (setq arg 1))
  (search-forward-regexp "^\n\n+" nil nil arg))


;; Exercise 2
;; ----------
;;
;; Write a function to search for duplicated words, such as `the the'.
;;
;; Solution:
(defun wenshan-search-for-duplicated-words (arg)
  "Search for duplicated words."
  (interactive "p")
  (or arg (setq arg 1))
  (push-mark)
  ;; This regexp is not perfect
  ;; but is fairly good over all:
  (if (re-search-forward
       "\\b\\([^@ \n\t]+\\)[ \n\t]+\\1\\b" nil 'move)
      (message "Found duplicated word.")
    (message "End of buffer")))
