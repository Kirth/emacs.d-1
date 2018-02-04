;; lisp-settings.el - settings for various Lisp dialects
;; -*- lexical-binding: t; -*-

;; All the lisps:

(add-to-list 'lisp-mode-hook #'company-mode)
(add-to-list 'lisp-mode-hook #'paredit-mode)
(add-to-list 'lisp-mode-hook #'adjust-parens-mode)

(define-key lisp-mode-map (kbd "TAB")
  #'company-indent-or-complete-common)

;; Common Lisp:
(setq inferior-lisp-program (concat (nix-store-path "sbcl") "/bin/sbcl"))

(add-to-list 'company-backends 'sly-company)
(add-to-list 'sly-mrepl-mode-hook #'paredit-mode)
(add-to-list 'sly-mrepl-mode-hook #'company-mode)

(define-key sly-mrepl-mode-map (kbd "TAB")
  #'company-indent-or-complete-common)

(provide 'lisp-setup)
