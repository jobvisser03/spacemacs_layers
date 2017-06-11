;;; packages.el --- jvisser_r layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Job Visser <jobvisser@192.168.2.13>
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
;; added to `jvisser_r-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `jvisser_r/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `jvis    company
ser_r/pre-init-PACKAGE' and/or
;;   `jvisser_r/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst jvisser_r-packages
  '(
    ess
    rainbow-delimiters
    smartparens
    )
  )

;; R --------------------------------------------------------------------------
;; (with-eval-after-load 'ess-site
;;   ;; ESS added by Job
;;   (add-hook 'ess-mode-hook
;;             (lambda ()
;;               (ess-toggle-underscore nil)))
;;   ;; For ESS consider underscore part of the word
;;   (add-hook 'ess-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; )

;; ESS added by Job

(defun jvisser_r/post-init-toggle-underscore ()
(add-hook 'ess-mode-hook
            (lambda ()
              (ess-toggle-underscore nil)))
  ;; For ESS consider underscore part of the word
  (add-hook 'ess-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  )

(defun jvisser_r/post-init-rainbow-delimiters ()
  (add-hook 'ess-mode-hook #'rainbow-delimiters-mode))

;; To enable smartparens-mode in ess and iess
(defun jvisser_r/post-init-smartparens ()
  (use-package smartparens
    :defer t
    :if ess-enable-smartparens
    :init
    (progn
      (add-hook 'ess-mode-hook 'smartparens-mode)
      (add-hook 'inferior-ess-mode-hook 'smartparens-mode))))

;;; packages.el ends here
