;;; ui.el --- Theme, font, and frame appearance -*- lexical-binding: t; -*-

(use-package monokai-theme
  :ensure
  :init
  (load-theme 'monokai t))

;; Global minor mode
;; (set-face-attribute 'default nil :height 175) ;; Scale font size for WSL
(column-number-mode 1)

(condition-case nil
    (set-frame-font "Martian Mono VF-16")
  (error (set-frame-font "Monospace-16")))

(provide 'ui)
;;; ui.el ends here
