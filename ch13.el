;;; ch13.el --- Solutions to the exercises in chapter 13 of the `An Introduction
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


;; Chapter 13: Counting: Repetition and Regexps
;; ============================================

;; Exercise 1
;; ----------
;;
;; Question:
;; Using a `while' loop, write a function to count the number of punctuation
;; marks in a region--period, comma, semicolon, colon, exclamation mark, and
;; question mark.  Do the same using recursion.
;;
;; Solution:

;; `while' loop version
(defun wenshan-count-punctuation-marks-in-region (beginning end)
  "Print the number of punctuation marks in the region using while."
  (interactive "r")
  (message "Counting punctuation marks in region...")
  ;; 1. Set up appropriate conditions.
  (save-excursion
    (let ((count 0))
      (goto-char beginning)

      ;; 2. Run the while loop.
      (while (and (< (point) end)
                  (re-search-forward "[.,;:!?]" end t))
        (setq count (1+ count)))

      ;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any punctuation mark."))
            ((= 1 count)
             (message
              "The region has 1 punctuation mark."))
            (t
             (message
              "The region has %d punctuation marks." count))))))


;; recursion version
(defun wenshan-count-punctuation-marks-in-region-helper (region-end)
  "Number of punctuation marks between point and REGION-END."

  ;; 1. do-again-test
  (if (and (< (point) region-end)
           (re-search-forward "[.,;:!?]" region-end t))

      ;; 2. then-part: the recursive call
      (1+ (wenshan-count-punctuation-marks-in-region-helper region-end))

    ;; 3. else-part
    0))

(defun wenshan-count-punctuation-marks-in-region-init (beginning end)
  "Print number of punctuation marks in the region using recursion."
  (interactive "r")
  (message "Counting punctuation marks in region ... ")
  (save-excursion
    (goto-char beginning)
    (let ((count (wenshan-count-punctuation-marks-in-region-helper end)))
      (cond ((zerop count)
             (message
              "The region does NOT have any punctuation mark."))
            ((= 1 count)
             (message "The region has 1 punctuation mark."))
            (t
             (message
              "The region has %d punctuation marks." count))))))
