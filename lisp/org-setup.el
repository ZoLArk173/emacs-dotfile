;;; org-setup.el --- Org writing helpers -*- lexical-binding: t; -*-

(use-package olivetti
  :ensure t
  :config
  (set-face-attribute 'olivetti-fringe nil
                      :background "gray20")
  :custom
  (olivetti-body-width 90)
  (olivetti-style 'fancy))

(defun my/org-writing-setup ()
  (olivetti-mode)
  (flyspell-mode)
  (visual-line-mode 1)
  (visual-wrap-prefix-mode 1)
  (display-line-numbers-mode -1))

(provide 'org-setup)
;;; org-setup.el ends here
