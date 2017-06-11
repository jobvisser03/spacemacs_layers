;;; packages.el --- python-data-science layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Job Visser <jobvisser@Jobs-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `python-data-science-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `python-data-science/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `python-data-science/pre-init-PACKAGE' and/or
;;   `python-data-science/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

;; (defconst python-data-science-packages
(setq python-data-science-packages
  '(
    eval-in-repl
    eval-in-repl-ielm
    eval-in-repl-hy
    val-in-repl-python))

;; Place REPL on the left of the script window when splitting.
(setq eir-repl-placement 'right)

;; Uncomment if no need to jump after evaluating current line
;; (setq eir-jump-after-eval nil)

;;; ielm support (for emacs lisp)
;; (require 'eval-in-repl-ielm)
;; Evaluate expression in the current buffer.
(setq eir-ielm-eval-in-current-buffer t)
;; for .el files
(define-key emacs-lisp-mode-map (kbd "<C-return>") 'eir-eval-in-ielm)
;; for *scratch*
(define-key lisp-interaction-mode-map (kbd "<C-return>") 'eir-eval-in-ielm)
;; for M-x info
(define-key Info-mode-map (kbd "<C-return>") 'eir-eval-in-ielm)

;;; Hy support
;; (require 'hy-mode) ; if not done elsewhere
;; (require 'eval-in-repl-hy)
(define-key hy-mode-map (kbd "<C-return>") 'eir-eval-in-hy)


;;; Python support
;; (require 'python) ; if not done elsewhere
;; (require 'eval-in-repl-python)
(add-hook 'python-mode-hook
          '(lambda ()
             (local-set-key (kbd "<C-return>") 'eir-eval-in-python)))

;;; packages.el ends here
