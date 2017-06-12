;;; packages.el --- ess layer packages file for Spacemacs.
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
;; added to `ess-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `ess/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `ess/pre-init-PACKAGE' and/or
;;   `ess/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:
(setq jv-ess-packages
  '(
    company
    ess
    ess-R-data-view
    ess-R-object-popup
    ess-smart-equals
    rainbow-delimiters
    smartparens
    ))

(defun jv-ess/init-ess ()
  (use-package ess-site
    :mode (("\\.sp\\'"           . S-mode)
           ("/R/.*\\.q\\'"       . R-mode)
           ("\\.[qsS]\\'"        . S-mode)
           ("\\.ssc\\'"          . S-mode)
           ("\\.SSC\\'"          . S-mode)
           ("\\.[rR]\\'"         . R-mode)
           ("\\.[rR]nw\\'"       . Rnw-mode)
           ("\\.[sS]nw\\'"       . Snw-mode)
           ("\\.[rR]profile\\'"  . R-mode)
           ("NAMESPACE\\'"       . R-mode)
           ("CITATION\\'"        . R-mode)
           ("\\.omg\\'"          . omegahat-mode)
           ("\\.hat\\'"          . omegahat-mode)
           ("\\.lsp\\'"          . XLS-mode)
           ("\\.do\\'"           . STA-mode)
           ("\\.ado\\'"          . STA-mode)
           ("\\.[Ss][Aa][Ss]\\'" . SAS-mode)
           ("\\.jl\\'"           . ess-julia-mode)
           ("\\.[Ss]t\\'"        . S-transcript-mode)
           ("\\.Sout"            . S-transcript-mode)
           ("\\.[Rr]out"         . R-transcript-mode)
           ("\\.Rd\\'"           . Rd-mode)
           ("\\.[Bb][Uu][Gg]\\'" . ess-bugs-mode)
           ("\\.[Bb][Oo][Gg]\\'" . ess-bugs-mode)
           ("\\.[Bb][Mm][Dd]\\'" . ess-bugs-mode)
           ("\\.[Jj][Aa][Gg]\\'" . ess-jags-mode)
           ("\\.[Jj][Oo][Gg]\\'" . ess-jags-mode)
           ("\\.[Jj][Mm][Dd]\\'" . ess-jags-mode))
    :commands (R stata julia SAS)
    :init
    (progn
      (when (configuration-layer/package-usedp 'company)
          (add-hook 'ess-mode-hook 'company-mode))))

  ;; R --------------------------------------------------------------------------
  (with-eval-after-load 'ess-site
    ;; ESS added by Job
    (add-hook 'ess-mode-hook
              (lambda ()
                (ess-toggle-underscore nil)))
    ;; For ESS
    (add-hook 'ess-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
    ;; For ESS consider underscore part of the word
    ;; (add-hook 'ess-r-mode-hook
    ;;           (lambda ()
    ;; (modify-syntax-entry ?_ "w")))

    (add-hook 'ess-mode-hook
              (lambda ()
                (ess-set-style 'C++ 'quiet)
                ;; Because
                ;;                                 DEF GNU BSD K&R C++
                ;; ess-indent-level                  2   2   8   5   4
                ;; ess-continued-statement-offset    2   2   8   5   4
                ;; ess-brace-offset                  0   0  -8  -5  -4
                ;; ess-arg-function-offset           2   4   0   0   0
                ;; ess-expression-offset             4   2   8   5   4
                ;; ess-else-offset                   0   0   0   0   0
                ;; ess-close-brace-offset            0   0   0   0   0
                (add-hook 'local-write-file-hooks
                          (lambda ()
                            (ess-nuke-trailing-whitespace)))))
    (setq ess-nuke-trailing-whitespace-p 'ask)
    ;; or even
    ;; (setq ess-nuke-trailing-whitespace-p t)
    ;; Perl
    (add-hook 'perl-mode-hook
              (lambda () (setq perl-indent-level 4)))

    (defun spacemacs/ess-start-repl ()
      "Start a REPL corresponding to the ess-language of the current buffer."
      (interactive)
      (cond
       ((string= "S" ess-language) (call-interactively 'R))
       ((string= "STA" ess-language) (call-interactively 'stata))
       ((string= "SAS" ess-language) (call-interactively 'SAS))))

    (spacemacs/set-leader-keys-for-major-mode 'ess-julia-mode
      "si" 'julia)
    (spacemacs/set-leader-keys-for-major-mode 'ess-mode
      "si" 'spacemacs/ess-start-repl
      ;; noweb
      "cC" 'ess-eval-chunk-and-go
      "cc" 'ess-eval-chunk
      "cd" 'ess-eval-chunk-and-step
      "cm" 'ess-noweb-mark-chunk
      "cN" 'ess-noweb-previous-chunk
      "cn" 'ess-noweb-next-chunk
      ;; REPL
      "sB" 'ess-eval-buffer-and-go
      "sb" 'ess-eval-buffer
      "sD" 'ess-eval-function-or-paragraph-and-step
      "sd" 'ess-eval-region-or-line-and-step
      "sL" 'ess-eval-line-and-go
      "sl" 'ess-eval-line
      "sR" 'ess-eval-region-and-go
      "sr" 'ess-eval-region
      "sT" 'ess-eval-function-and-go
      "st" 'ess-eval-function
      ;; R helpers
      "hd" 'ess-R-dv-pprint
      "hi" 'ess-R-object-popup
      "ht" 'ess-R-dv-ctable
      )
    (define-key ess-mode-map (kbd "<s-return>") 'ess-eval-line)
    (define-key inferior-ess-mode-map (kbd "C-j") 'comint-next-input)
    (define-key inferior-ess-mode-map (kbd "C-k") 'comint-previous-input)))

(defun jv-ess/init-ess-R-data-view ())

(defun jv-ess/init-ess-R-object-popup ())

(defun jv-ess/post-init-rainbow-delimiters ()
  (add-hook 'ess-mode-hook #'rainbow-delimiters-mode))

;; To enable smart-equals-mode
(defun jv-ess/init-ess-smart-equals ()
  (use-package ess-smart-equals
    :defer t
    :if ess-enable-smart-equals
    :init
    (progn
      (add-hook 'ess-mode-hook 'ess-smart-equals-mode)
      (add-hook 'inferior-ess-mode-hook 'ess-smart-equals-mode))))

;; To enable smartparens-mode in ess and iess
(defun jv-ess/post-init-smartparens ()
  (use-package smartparens
    :defer t
    :if ess-enable-smartparens
    :init
    (progn
      (add-hook 'ess-mode-hook 'smartparens-mode)
      (add-hook 'inferior-ess-mode-hook 'smartparens-mode))))


;;; packages.el ends here
