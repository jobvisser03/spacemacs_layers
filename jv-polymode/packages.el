;;; packages.el --- polymode layer packages file for Spacemacs.
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
;; added to `polymode-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `polymode/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `polymode/pre-init-PACKAGE' and/or
;;   `polymode/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst jv-polymode-packages
  '(polymode))
(defun jv-polymode/init-polymode ()
  (use-package polymode
    :mode (("\\.Rmd"   . Rmd-mode))
    :init
    (progn
      (defun Rmd-mode ()
        "ESS Markdown mode for Rmd files"
        (interactive)
        (require 'poly-R)
        (require 'poly-markdown)
        (R-mode)
        (poly-markdown+r-mode))
      ))
  )

(add-hook 'ess-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; For ES (add-hook 'ess-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
    ;; For ESS consider underscore part of the word
    ;; (add-hook 'ess-r-mode-hook
    ;;           (lambda ()
      ;; consider underscore part of the word
;; (add-hook 'ess-r-mode-hook
;;           (lambda ()

;;; packages.el ends here
