;;; tools.el --- Magit, terminal, tramp, recent files -*- lexical-binding: t; -*-

(use-package magit
  :ensure)

(use-package eat
  :ensure)

(use-package recentf
  :ensure nil
  :init
  (recentf-mode 1)
  :custom
  (recentf-max-saved-items 200))

(setq remote-file-name-inhibit-locks t
      tramp-use-scp-direct-remote-copying t
      remote-file-name-inhibit-auto-save-visited t)

(setq tramp-copy-size-limit (* 1024 1024) ;; 1MB
      tramp-verbose 2)

(provide 'tools)
;;; tools.el ends here
