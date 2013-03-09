;; ch02.el --- Solutions to the exercises in chapter 2 of the `An Introduction
;; to Programming in Emacs Lisp'

;; Copyright (C) 2013 Ren Wenshan

;; Author: Ren Wenshan <renws1990@gmail.com>
;; Keywords: Emacs Lisp
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


;; Chapter 2: Practicing Evaluation
;; ================================

;; Exercise 1
;; ----------
;;
;; Question:
;; Find a file with which you are working and move towards its middle.  Find its
;; buffer name, file name, length, and your position in the file.
;;
;; Solution: Move towards to the middle of this buffer, and `eval' the following
;; expressions one by one
(buffer-name)
(buffer-file-name)
(buffer-size)
(point)
