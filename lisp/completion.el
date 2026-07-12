;;; completion.el --- Completion and minibuffer stack -*- lexical-binding: t; -*-

(use-package company
  :ensure
  :custom
  (company-idle-delay 0.15))

;; (use-package company-fuzzy
;;   :ensure
;;   :hook (company-mode . company-fuzzy-mode))

;; Enable Vertico.
(use-package vertico
  :ensure
  :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  (keymap-set vertico-map "M-?" #'minibuffer-completion-help)
  (keymap-set vertico-map "M-RET" #'vertico-exit-input)
  (keymap-set vertico-map "M-TAB" #'minibuffer-complete)
  :init
  (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure
  :init
  (savehist-mode))

;; Emacs minibuffer configurations.
(use-package emacs
  :custom
  ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
  ;; to switch display modes.
  (context-menu-mode t)
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Do not allow the cursor in the minibuffer prompt
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt)))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :ensure
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package consult
  :ensure t
  :bind (("C-s" . consult-line)           ;; search in buffer
         ("C-M-l" . consult-imenu)        ;; jump to symbols
         ("C-x b" . consult-buffer)       ;; switch buffers
         ("C-x C-r" . consult-recent-file)
         ("M-y" . consult-yank-pop)       ;; better kill-ring
         ("C-c k" . consult-ripgrep)))    ;; project search (needs rg)

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)         ;; do action
         ("C-;" . embark-dwim)        ;; smart action
         ("C-h B" . embark-bindings)) ;; show keybindings
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(provide 'completion)
;;; completion.el ends here
