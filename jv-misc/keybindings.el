;;======================================================================
;; Keybindings only
;;======================================================================

;; can't get this keybinding working, only in the sql +lang layer
;; (evil-define-key 'normal sql-mode-map (kbd "h k") 'sql-beautify-region)

;; (spacemacs/set-leader-keys-for-major-mode 'sql-mode
;;   "hk" 'sql-beautify-region)

(local-set-key (kbd "<C-return>") 'elpy-shell-send-statement-and-step)
(local-set-key (kbd "<M-return>") 'elpy-shell-send-word)

;; eir-eval-line-in-python using elpy now
;; (global-set-key (kbd "C-c l") 'eir-eval-line-in-python)
;; (global-set-key (kbd "C-c z") 'eir-eval-word-in-python)

;; C-TAB move between buffers
(global-set-key [(control tab)] 'other-window)

;; Change font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Navigate per paragraph
(global-set-key (kbd "s-<down>") 'evil-forward-paragraph)
(global-set-key (kbd "s-<up>") 'evil-backward-paragraph)

;; Smartparens keybindings
(define-key evil-insert-state-map (kbd "M-<right>") 'forward-word)
(define-key evil-insert-state-map (kbd "M-<left>") 'backward-word)
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line) ;; was 'evil-paste-last-insertion
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)    ;; was 'evil-copy-from-below
;; smartparens keybindings

(global-set-key (kbd "C-M-a") 'sp-beginning-of-sexp)
(global-set-key (kbd "C-M-e") 'sp-end-of-sexp)
 ;; ("C-M-a" . sp-beginning-of-sexp)
 ;; ("C-M-e" . sp-end-of-sexp)

(global-set-key (kbd "C-<down>") 'sp-down-sexp)
(global-set-key (kbd "C-<up>") 'sp-up-sexp)
 ;; ("C-<down>" . sp-down-sexp)
 ;; ("C-<up>"   . sp-up-sexp)
(global-set-key (kbd "M-<down>") 'sp-backward-down-sexp)
(global-set-key (kbd "M-<up>") 'sp-backward-up-sexp)
 ;; ("M-<down>" . sp-backward-down-sexp)
 ;; ("M-<up>"   . sp-backward-up-sexp)

 ;; ("C-M-f" . sp-forward-sexp)
 ;; ("C-M-b" . sp-backward-sexp)

 ;; ("C-M-n" . sp-next-sexp)
 ;; ("C-M-p" . sp-previous-sexp)

 ;; ("C-S-f" . sp-forward-symbol)
 ;; ("C-S-b" . sp-backward-symbol)

(global-set-key (kbd "C-<right>") 'sp-forward-slurp-sexp)
;; (global-set-key (kbd "M-<right>") 'sp-forwared-barf-sexp)
 ;; ("C-<right>" . sp-forward-slurp-sexp)
 ;; ("M-<right>" . sp-forward-barf-sexp)
(global-set-key (kbd "C-<left>") 'sp-backward-slurp-sexp)
;; (global-set-key (kbd "M-<left>") 'sp-backward-barf-sexp)
 ;; ("C-<left>"  . sp-backward-slurp-sexp)
 ;; ("M-<left>"  . sp-backward-barf-sexp)

 ;; ("C-M-t" . sp-transpose-sexp)
(global-set-key (kbd "C-M-k") 'sp-kill-sexp)
 ;; ("C-M-k" . sp-kill-sexp)
 ;; ("C-k"   . sp-kill-hybrid-sexp)
 ;; ("M-k"   . sp-backward-kill-sexp)
(global-set-key (kbd "C-M-w") 'sp-copy-sexp)
 ;; ("C-M-w" . sp-copy-sexp)
(global-set-key (kbd "C-M-d") 'sp-delete-sexp)
 ;; ("C-M-d" . delete-sexp)

 ;; ("M-<backspace>" . backward-kill-word)
(global-set-key (kbd "C-<backspace>") 'sp-backward-kill-word)
 ;; ("C-<backspace>" . sp-backward-kill-word)
 ;; ([remap sp-backward-kill-word] . backward-kill-word)

(global-set-key (kbd "M-]") 'sp-unwrap-sexp)
(global-set-key (kbd "M-[") 'sp-backward-unwrap-sexp)
 ;; ("M-[" . sp-backward-unwrap-sexp)
 ;; ("M-]" . sp-unwrap-sexp)

 ;; ("C-x C-t" . sp-transpose-hybrid-sexp)

 ;; ("C-c ("  . wrap-with-parens)
 ;; ("C-c ["  . wrap-with-brackets)
 ;; ("C-c {"  . wrap-with-braces)
 ;; ("C-c '"  . wrap-with-single-quotes)
 ;; ("C-c \"" . wrap-with-double-quotes)
 ;; ("C-c _"  . wrap-with-underscores)
 ;; ("C-c `"  . wrap-with-back-quotes))
