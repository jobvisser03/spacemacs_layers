;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     rust
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     csv
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     plantuml
     (markdown :variables markdown-live-preview-engine 'vmd)
     ;; latex
     org
     ;; gnus
     ;; use iterm goto
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom
     ;;        shell-default-shell 'eshell)
     spell-checking
     syntax-checking
     version-control
     themes-megapack
     evil-commentary
     html
     javascript
     ;; ipython-notebook
     docker
     python
     yaml
     sql
     gtags
     restclient
     ;; PRIVATE
     (jv-ess :variables
             ess-enable-smart-equals nil
             ess-enable-smartparens t )
     jv-polymode
     jv-misc
     ;; jv-python
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      eval-in-repl
                                      smooth-scroll
                                      all-the-icons
                                      ;; realgud
                                      ;; auctex-latex
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 1
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-dark
                         gruvbox-dark-medium
                         zenburn
                         solarized-dark
                         material
                         afternoon
                         flatland
                         monokai
                         gotham
                         jbeans
                         ;; wilson
                         ;; ample
                         ;; darkburn
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '(
                               ;; "Source Code Pro"
                               ;; "Inconsolata"
                               "Fira Code"
                               ;; "Meslo LG M for Powerline"
                               :size 19
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "JV"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 96
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 85
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol)
     )

  ;; log more undo actions
  (setq evil-want-fine-undo t)

  ;; set neo-tree theme to fancy icons
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))


  ;; ;; set interpreter to handle output utf8 error in inferior python
  (setenv "PYTHONIOENCODING" "UTF-8")
  (setenv "LANG" "en_US.UTF-8")
  (setenv "LC" "en_US.UTF-8")
  (setenv "LC_ALL" "en_US.UTF-8")

)


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Python support ;;
  (require 'python) ; if not done elsewhere
  (require 'eval-in-repl-python)
  (defun shell-send-word ()
    (interactive)
    (eir-python-shell-send-string (thing-at-point 'symbol))
    )

  (defun shell-send-line ()
    (interactive)
    (eir-python-shell-send-string (thing-at-point 'line))
    )

  (defun shell-send-word-info ()
    (interactive)
    (eir-python-shell-send-string (format "%s.info()" (thing-at-point 'symbol)))
    )

  (defun shell-send-word-type ()
    (interactive)
    (eir-python-shell-send-string (format "type(%s)" (thing-at-point 'symbol)))
    )

  (defun shell-send-word-head ()
    (interactive)
    (eir-python-shell-send-string (format "%s.head()" (thing-at-point 'symbol)))
    )

  (defun shell-send-word-describe ()
    (interactive)
    (eir-python-shell-send-string (format "%s.describe()" (thing-at-point 'symbol)))
    )

  (add-hook 'python-mode-hook
            '(lambda ()
               (local-set-key (kbd "<M-return>") 'shell-send-word)
               (spacemacs/set-leader-keys-for-major-mode 'python-mode "sl" 'shell-send-line)
               (spacemacs/set-leader-keys-for-major-mode 'python-mode "sw" 'shell-send-word)
               (spacemacs/set-leader-keys-for-major-mode 'python-mode "hi" 'shell-send-word-info)
               (spacemacs/set-leader-keys-for-major-mode 'python-mode "ht" 'shell-send-word-type)
               (spacemacs/set-leader-keys-for-major-mode 'python-mode "hp" 'shell-send-word-head)
               (spacemacs/set-leader-keys-for-major-mode 'python-mode "hv" 'shell-send-word-describe)
               (local-set-key (kbd "<C-return>") 'eir-eval-in-python)))

  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "-i")

  ;; smooth scroll
  ( require 'smooth-scroll                        ) ;; Smooth scroll
  ( smooth-scroll-mode 1                          ) ;; Enable it
  ( setq smooth-scroll/vscroll-step-size 6        ) ;; Set the speed right

  ;; final solution was 'officially' installing the Source Code Pro font on Mac:
  ;; brew tap caskroom/fonts
  ;; brew cask install font-source-code-pro
  (setq powerline-default-separator 'utf-8) ;; somehow gives the arrow seperator, looks fine
  (setq powerline-height 19)

  ;; Enable indent mode for org
  (setq org-indent-mode t)

  ;; Setup Getting Things Done Workflow using:
  ;; https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html
  (setq org-agenda-files '("~/gtd/inbox.org"
                           "~/gtd/gtd.org"
                           "~/gtd/tickler.org"))

  (setq org-capture-templates '(
                                ;;("m" "Meeting" entry (file "~/git/org/refile.org")
                                ;; "* %? :MEETING:\n%U" :clock-in t :clock-resume t)
                                ("f" "Meeting [notes]" entry
                                 (file+headline "~/OneDrive - VIQTOR DAVIS/jibes/notes/notes.org" "Notes")
                                 "* Meeting: %? \n** Attendees: \n - %i%?:\n** Goal or Problem: \n** Context: ")
                                ("t" "Todo [inbox]" entry
                                 (file+headline "~/gtd/inbox.org" "Tasks")
                                 "* TODO %i%?")
                                ("T" "Tickler" entry
                                 (file+headline "~/gtd/tickler.org" "Tickler")
                                 "* %i%? \n %U")))

  (setq org-refile-targets '(("~/gtd/gtd.org" :maxlevel . 2)
                             ("~/gtd/someday.org" :level . 1)
                             ("~/gtd/tickler.org" :maxlevel . 2)))

  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

  ;; Enable delete-selection-mode for NORMAL people in the HERE and NOW
  (setq delete-selection-mode t)

  ;; To fix the error as suggested here: https://github.com/syl20bnr/spacemacs/pull/9547
  ;; “Symbol’s value as variable is void: helm-bookmark-map”
  ;; (require 'helm-bookmark)

  ;; SQL beatifier
  (defun sql-beautify-region (beg end)
    "Beautify SQL in region between beg and END."
    (interactive "r")
    (save-excursion
      (shell-command-on-region beg end "anbt-sql-formatter" nil t)))
  ;; change sqlbeautify to anbt-sql-formatter if you
  ;;ended up using the ruby gem

  (defun sql-beautify-buffer ()
    "Beautify SQL in buffer."
    (interactive)
    (sql-beautify-region (point-min) (point-max)))

  ;; Transparency by default
  (set-frame-parameter (selected-frame) 'alpha
                       (cons dotspacemacs-active-transparency
                             dotspacemacs-inactive-transparency))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" "1dd7b369ab51f00e91b6a990634017916e7bdeb64002b4dda0d7a618785725ac" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "2540689fd0bc5d74c4682764ff6c94057ba8061a98be5dd21116bf7bf301acfb" "04232a0bfc50eac64c12471607090ecac9d7fd2d79e388f8543d1c5439ed81f5" "2a7beed4f24b15f77160118320123d699282cbf196e0089f113245d4b729ba5d" "af4dc574b2f96f5345d55b98af024e2db9b9bbf1872b3132bc66dffbf5e1ba1d" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "2593436c53c59d650c8e3b5337a45f0e1542b1ba46ce8956861316e860b145a0" "b583823b9ee1573074e7cbfd63623fe844030d911e9279a7c8a5d16de7df0ed0" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "1436d643b98844555d56c59c74004eb158dc85fc55d2e7205f8d9b8c860e177f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "3a5f04a517096b08b08ef39db6d12bd55c04ed3d43b344cf8bd855bde6d3a1ae" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "19ba41b6dc0b5dd34e1b8628ad7ae47deb19f968fe8c31853d64ea8c4df252b8" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#37474f" t)
 '(hl-sexp-background-color "#1c1f26")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (ob-restclient ob-http company-restclient know-your-http-well toml-mode racer flycheck-rust cargo rust-mode poly-markdown vmd-mode plantuml-mode poly-R transient lv restclient find-file-in-project elpy powerline spinner less-css-mode parent-mode flx let-alist anzu evil goto-chg undo-tree request projectile pkg-info bind-map bind-key packed async f s ace-window avy popup dockerfile-mode docker tablist docker-tramp iedit dash epl org-plus-contrib highlight helm hydra smartparens helm-core all-the-icons memoize web-beautify livid-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js-doc company-tern tern coffee-mode realgud zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monochrome-theme molokai-theme moe-theme minimal-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gandalf-theme flatui-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme org-category-capture alert log4e gntp markdown-mode dash-functional haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter flyspell-correct-ivy flyspell-correct pos-tip flycheck magit magit-popup git-commit ghub with-editor paredit ctable ess julia-mode skewer-mode request-deferred websocket deferred js2-mode simple-httpd web-completion-data company yasnippet anaconda-mode pythonic auto-complete wgrep smex ivy-hydra evil-nerd-commenter counsel-projectile counsel swiper ivy yapfify yaml-mode ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit sql-indent spaceline smooth-scroll smeargle slim-mode scss-mode sass-mode restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin polymode pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree move-text monokai-theme mmm-mode material-theme markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint jbeans-theme indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido flatland-theme fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu eval-in-repl ess-smart-equals ess-R-data-view emmet-mode elisp-slime-nav ein dumb-jump diminish diff-hl define-word cython-mode csv-mode company-web company-statistics company-anaconda column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-link ace-jump-helm-line ac-ispell)))
 '(python-shell-interpreter "ipython" t)
 '(python-shell-interpreter-args "-i" t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#263238" :family "Meslo LG M for Powerline" :foundry "nil" :slant normal :weight normal :height 150 :width normal)))))
