;;Mac key rebinds
(setq mac-option-modifier 'control)
(setq mac-command-modifier 'meta)
(setq mac-control-modifier 'super)

;;tell tramp to use ssh
(setq tramp-default-method "ssh")



;; Enable line numbers in all files. 
 (global-linum-mode 1)

;; Hide splash screen & banner
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)  

;; Enable auto-indenting
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Add new lines if using C-n at the end of the buffer
(setq next-line-add-newlines t)

;; Use Zenburn Theme
;; Theme must be stored in "~/emacsBackup/.emacs.d/themes"
;; Theme available @ wikemacs.org/wiki/Zenburn-theme
(add-to-list 'custom-theme-load-path "~/emacsBackup/.emacs.d/themes/")
(load-theme 'zenburn t)

;; Start with subword mode on
;; easier navigation of camelCase
(load "subword.el")
(global-subword-mode 1)
;; Turn on Visible Mark
(add-to-list 'load-path "~/emacsBackup/.emacs.d/general-tools/")
(load "visible-mark.el")

;; Turn on Whitespace Mode
(require 'whitespace)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)
(setq whitespace-global-modes '(c-mode c++-mode cuda-mode web-mode python-mode php-mode))

;; show highlight hex colors with that color
(setq-default rainbow-mode 1)


;;Display tabs as 4 spaces.
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;;Next line moves to next ACTUAL line
;;ignores word wrap
(setq line-move-visual 'nil)

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)

(autoload 'wc-mode "wc-mode")


;;Activate up and down transposing
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  )

(global-set-key (kbd "<M-down>") 'move-line-down)
(global-set-key (kbd "<M-up>") 'move-line-up)

(define-key minibuffer-local-map "\M-s" nil)

(require 'flycheck )
