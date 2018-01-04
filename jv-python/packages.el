;;; packages.el --- jv-python layer packages file for Spacemacs.
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
;; added to `jv-python-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `jv-python/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `jv-python/pre-init-PACKAGE' and/or
;;   `jv-python/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst jv-python-packages
  '(elpy))

(defun jv-python/init-elpy ()
  (use-package elpy
    :diminish elpy-mode
    :config

    ;; Elpy removes the modeline lighters. Let's override this
    (defun elpy-modules-remove-modeline-lighter (mode-name))

    (setq elpy-modules '(elpy-module-sane-defaults
                         elpy-module-eldoc
                         elpy-module-pyvenv))

    (when (configuration-layer/layer-usedp 'auto-completion)
      (add-to-list 'elpy-modules 'elpy-module-company)
      (add-to-list 'elpy-modules 'elpy-module-yasnippet))

    (elpy-enable)
    ))

(defun jv-python/elpy-shell-send-word ()
  "Send word at cursor."
  (interactive)
  (elpy-shell--ensure-shell-running)
  (when (not elpy-shell-echo-input) (elpy-shell--append-to-shell-output "\n"))
  ;; (let ((beg (progn (evil-backward-word-begin) (point)))
        ;; (end (progn (evil-a-word) (point))))
    ;; (elpy-shell--flash-and-message-region beg end)
    (elpy-shell--with-maybe-echo
     ;; (python-shell-send-string (elpy-shell--region-without-indentation beg end))))
     ;; (python-shell-send-string (thing-at-point 'symbol))))
  (python-shell-send-string (thing-at-point 'symbol)))
  ;; (python-shell-send-string (word-at-point))))
  ;; (python-shell-send-string (word-at-point)))
  ;; (forward-word)
  )

;;; packages.el ends here
