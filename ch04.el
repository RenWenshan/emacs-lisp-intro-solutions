;;; ch04.el --- Solutions to the exercises in chapter 04 of the `An Introduction
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


;; Chapter 4: A Few Buffer-Related Functions
;; =========================================

;; Exercise 1
;; ----------
;;
;; Question:
;; Write your own `simplified-end-of-buffer' function definition; then test it
;; to see whether it works.
;;
;; Solution:
(defun wenshan-simplified-end-of-buffer ()
  "Move point to the end of current buffer"
  (interactive)
  (push-mark)
  (goto-char (point-max)))


;; Exercise 2
;; ----------
;;
;; Question:
;; Use `if' and `get-buffer' to write a function that prints a message telling
;; you whether a buffer exists.
;;
;; Solution:
(defun wenshan-buffer-exists-p (buffer)
  (interactive
   (list (read-buffer "buffer name: " (other-buffer
                                       (current-buffer) t))))
  (if (get-buffer buffer)
      (message "buffer exists!")
    (message "buffer not exist!!!")))


;; Exercise 3
;; ----------
;;
;; Question:
;; Using `find-tag', find the source for the `copy-to-buffer' function.
;;
;; Solution: press "M-. copy-to-buffer", then choose the appropriate TAGS file
