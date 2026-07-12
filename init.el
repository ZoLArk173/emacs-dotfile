;;; init.el --- Main Emacs entry point -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'packages)
(require 'ui)
(require 'completion)
(require 'editing)
(require 'tools)
(require 'org-setup)

;; Keep Custom-generated settings out of hand-edited files.
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
