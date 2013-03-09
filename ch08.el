;;; ch08.el --- Solutions to the exercises in chapter 08 of the `An Introduction
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


;; Chapter 8: Cutting and Storing Text
;; ===================================

;; Exercise 1
;; ----------
;;
;; Question:
;; Write an interactive function that searches for a string.  If the search
;; finds the string, leave point after it and display a message that says
;; "Found!".  (Do not use `search-forward' for the name of this function; if you
;; do, you will overwrite the existing version of `search-forward' that comes
;; with Emacs.  Use a name such as `test-search' instead.)
;;
;; Solution:
(defun wenshan-test-search (string-to-search)
  "Search current buffer for `string-to-search' and display
`Found' if succeed"
  (interactive
   ;; read in `string-to-search'
   (list (read-string "wenshan-test-search: ")))
  (goto-char (point-min))
  (when (search-forward string-to-search)
    (message "Found!")))
