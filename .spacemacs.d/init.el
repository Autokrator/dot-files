;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation nil
   dotspacemacs-ask-for-lazy-installation nil
   dotspacemacs-configuration-layer-path nil
   dotspacemacs-configuration-layers
   '(
     (auto-completion
      :variables
      auto-completion-enable-snippets-in-popup t
      auto-completion-return-key-behavior 'complete
      auto-completion-tab-key-behavior 'cycle
      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/"
      auto-completion-enable-help-tooltip 'manual
      :disabled-for org)
     (c-c++ :variables
            c-c++-enable-clang-support t
            c-c++-default-mode-for-headers 'c++-mode)
     emacs-lisp
     git
     html
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (ipython-notebook :variable
                       ein:complete-on-dot nil
                       ein:completion-backend 'ein:use-company-backend)
     javascript
     markdown
     org
     (python :variables
             python-enable-yapf-format-on-save t
             python-sort-imports-on-save t)
     (ranger :variables
             ranger-override-dired t
             ranger-cleanup-on-disable t
             ranger-cleanup-eagerly t)
     (shell
      :variables
      shell-default-height 30
      shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
     shell-scripts

     ;; Personal
     custom-theming
     custom-org)
   dotspacemacs-additional-packages '(doom-themes
                                      hlinum)
  dotspacemacs-frozen-packages '()
  dotspacemacs-excluded-packages '()
  dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(bookmarks (recents . 5) projects)
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(doom-molokai
                         doom-one
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text t
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Home"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize t
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers '(:relative nil
                               :enabled-for-modes prog-mode
                               :disabled-for-modes nil)
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'all
   dotspacemacs-mode-line-theme '(spacemacs
                                  :separator zigzag
                                  :separator-scale 1.4)
   ))

(defun dotspacemacs/user-init ()
 (setq-default
   ;; Whitespace mode
   whitespace-style '(face tabs tab-mark newline-mark)
   whitespace-display-mappings
   '((newline-mark 10 [172 10])
     (tab-mark 9 [9655 9]))))

(defun dotspacemacs/user-config ()
  ;; Misc
  (hlinum-activate)
  (add-hook 'text-mode-hook 'auto-fill-mode)
  (setq-default
   insert-directory-program "gls"
   dired-use-ls-dired t
   multi-term-program "/bin/zsh")

  ;; Theming Extras
  (spaceline-toggle-buffer-position-off)
  (spaceline-toggle-hud-off)
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-purpose-off)
  (add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist
             '(ns-appearance . dark))
  (setq-default
   powerline-image-apple-rgb t
   frame-title-format '(""))
  (setq initial-frame-alist '((top . 0) (left . 0) (width . 100) (height . 40)))
  (with-eval-after-load 'org
    (set-face-background 'org-level-1 (face-attribute 'default :background))
    (set-face-background 'org-date-selected (face-attribute 'highlight :background)))

  ;; C-C++
  (defun clang-format-bindings ()
    (define-key c++-mode-map [tab] 'clang-format-buffer))
  (add-hook 'c++-mode-hook 'clang-format-bindings)
  (add-hook 'c-mode-hook 'clang-format-bindings)
  (c-add-style "personal"
               '((indent-tabs-mode . nil)
                 (c-basic-offset . 2)
                 (c-offsets-alist
                  (substatement-open . 0)
                  (inline-open . 0)
                  (statement-cont . c-lineup-assignments)
                  (inextern-lang . 0)
                  (innamespace . +))))
  (push '(other . "personal") c-default-style)

  ;; Interpreter List
  (add-to-list 'interpreter-mode-alist '("bash" . sh-mode))
  (add-to-list 'interpreter-mode-alist '("zsh" . sh-mode))
  (add-to-list 'interpreter-mode-alist '("python" . python-mode))

  ;; Python
  (remove-hook 'python-mode-hook 'importmagic-mode)
  (with-eval-after-load "company"
    '(add-to-list 'company-backends '(company-anaconda :with company-capf))
    '(add-to-list 'company-backends 'ein:company-backend))
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  (global-company-mode t)

  ;; Experimental
  (setq browse-url-browser-function 'browse-url-default-macosx-browser))


