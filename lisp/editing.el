;;; editing.el --- Editing aids and programming hooks -*- lexical-binding: t; -*-

(use-package avy
  :ensure
  :bind
  (("C-'" . avy-goto-word-1)))

(use-package flycheck
  :ensure)

(winner-mode 1)

;; A series of minor mode for coding
(dolist (hook '(c-mode-hook
		c++-mode-hook
		python-mode-hook
		emacs-lisp-mode-hook
		verilog-mode-hook))
  (add-hook hook 'hs-minor-mode)
  (add-hook hook 'company-mode))

(provide 'editing)
;;; editing.el ends here
