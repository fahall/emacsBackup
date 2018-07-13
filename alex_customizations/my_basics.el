;;Mac key rebinds
(setq mac-option-modifier 'control)
(setq mac-command-modifier 'meta)
(setq mac-control-modifier 'super)

;;tell tramp to use ssh
(setq tramp-default-method "ssh")

;; Enable line numbers in all files. 
;; (global-linum-mode 1)

;; Hide splash screen & banner
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)  

;; Do not create new frame if one exists when opening file. 
(setq ns-pop-up-frames nil)

;; Enable auto-indenting
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Add new lines if using C-n at the end of the buffer
(setq next-line-add-newlines t)

;; Use Zenburn Theme
;; Theme must be stored in "~/emacsBackup/.emacs.d/themes"
;; Theme available @ wikemacs.org/wiki/Zenburn-theme
(add-to-list 'custom-theme-load-path "~/emacsBackup/.emacs.d/themes/")
;; (load-theme 'zenburn t)

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

(unless (fboundp 'helm-mode)
  (ido-mode t)
  (setq ido-enable-flex-matching t))

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)

(require 'uniquify )
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(show-paren-mode 1)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell nil
      load-prefer-newer t
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;; use tramp to upgrade to sudo
(defun sudired ()
  (interactive)
  (dired "/sudo::/"))



;; Raise garbage collection threshold when minibuffer open
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))
;; Return garbage collection back to normal after exiting minibuffer
(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 16777216))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)
