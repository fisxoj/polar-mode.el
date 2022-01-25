;;; polar-mode.el --- Major mode for the polar programming language

;;; Commentary:

;; Copyright 2022 The Matt Novenstern <fisxoj@gmail.com>.  All rights reserved.
;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; It is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
;; License for more details.

;; You should have received a copy of the GNU General Public License
;; along with it.  If not, see <http://www.gnu.org/licenses/>.

;; Author: Matt Novenstern
;; Version: 0.0.1
;; Keywords: languages polar
;; Package-Requires: ((emacs "20.1"))
;; URL: https://github.com/fisxoj/polar-mode.el
;;
;; This file is not part of GNU Emacs.

;;; Code:

;;;###autoload
(add-to-list 'auto-mode-alist (cons "\\.polar\\'" 'polar-mode))

(setq polar-highlights
      (let ((keywords '("and" "cut" "debug" "forall" "if" "in" "isa" "matches" "mod" "new" "not" "or" "print" "rem"))
            (operators '(":=" "*" "/" "-" "+" "|" ""))
            (boolean '("true" "false")))
        `(("\\s-\\(_[a-zA-Z_][a-zA-Z0-9_]*\\)" . (1 font-lock-comment-face))
          ("\\([a-zA-Z_][a-zA-Z0-9_]*\\)\\s-*(" . (1 font-lock-function-name-face))
          ("\\([A-Z][a-zA-Z0-9]*\\):" . font-lock-constant-face)
          ("[A-Z][a-zA-Z0-9]*" . font-lock-type-face)
          (,(regexp-opt keywords 'words) . font-lock-keyword-face)
          (,(regexp-opt boolean 'words) . font-lock-constant-face)
          ;; Inline queries
          ("^\\?=" . font-lock-warning-face))))

(define-derived-mode polar-mode prog-mode "Polar"
  "Major mode for editing polar policies."
  (setq font-lock-defaults '(polar-highlights))
  (modify-syntax-entry ?# "<" polar-mode-syntax-table)
  (modify-syntax-entry ?\n ">" polar-mode-syntax-table))

(provide 'polar-mode)
