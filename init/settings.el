(require 'uniquify)
(require 'notmuch)

;; Make ivy go!
(ivy-mode 1)
(counsel-mode 1)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; Enable fuzzy matching in ivy (requires flx installed for sane
;; ordering)
(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; We don't live in the 80s, but we're also not a shitty web app.
(setq gc-cons-threshold 20000000)

(setq uniquify-buffer-name-style 'forward)

; Fix some defaults
(setq visible-bell nil
      inhibit-startup-message t
      color-theme-is-global t
      sentence-end-double-space nil
      shift-select-mode nil
      uniquify-buffer-name-style 'forward
      whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 80
      default-directory "~"
      fill-column 80
      ediff-split-window-function 'split-window-horizontally)

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

(set-default 'indent-tabs-mode nil)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Make emacs behave sanely (overwrite selected text)
(delete-selection-mode 1)

;; Keep your temporary files in tmp, emacs!
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; Show time in 24h format
(setq display-time-24hr-format t)

;; Make ace-window behave in a sane way:
(setq aw-keys '(?f ?j ?d ?k ?s ?l ?a)) ; Homerow keys in sensible order!
(setq aw-scope 'frame) ; There are many frames in exwm, I don't care!

;; Configure pinentry for use with GPG
(setq epa-pinentry-mode 'loopback)
(pinentry-start)

;; Close mail buffers after sending mail
(setq message-kill-buffer-on-exit t)

(provide 'settings)
