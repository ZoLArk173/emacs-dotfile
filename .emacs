(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; === Theme ===
(use-package monokai-theme
  :ensure
  :init
  (load-theme 'monokai t))

;; === Configurations ===
;; Global minor mode
;; (set-face-attribute 'default nil :height 175) ;; Scale font size for WSL
(column-number-mode 1)
(winner-mode 1)

;; A series of minor mode for coding
(dolist (hook '(c-mode-hook
		c++-mode-hook
		python-mode-hook
		emacs-lisp-mode-hook
		verilog-mode-hook))
  (add-hook hook 'hs-minor-mode)
  (add-hook hook 'company-mode))

(condition-case nil
    (set-frame-font "Martian Mono VF-16")
  (error (set-frame-font "Monospace-16")))

;; === Packages ===
(use-package company
  :ensure
  :custom
  (company-idle-delay 0.15))

(use-package magit
  :ensure)

(use-package ivy
  :ensure
  :bind
  (("C-s" . swiper)
   ("C-s" . swiper-backward))
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure
  :after ivy
  :config
  (counsel-mode 1))

(use-package swiper
  :ensure)

(use-package ivy-prescient
  :ensure
  :after ivy
  :custom
  (prescient-persist-mode 1) ;; remember across sessions
  :config
  (ivy-prescient-mode 1))

(use-package eat
  :ensure)

(use-package avy
  :ensure
  :bind
  (("C-'" . avy-goto-word-1)))

(use-package flycheck
  :ensure)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(monokai-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
