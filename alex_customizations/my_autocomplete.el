;;Autocomplete Config
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; Enable Smart Scan Mode
;; Quickly search for identifier at current point
(load "smartscan.el")
(smartscan-mode 1)

;;Add autocomplete for coding
(add-to-list 'load-path "~/emacsBackup/.emacs.d/general-tools/")
(add-to-list 'load-path "~/emacsBackup/.emacs.d/auto-complete-1.3.1")
(add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools/ac-dict")
(add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools/ac-clang")
(add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools/ac-anaconda")
(add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools/ac-html")

