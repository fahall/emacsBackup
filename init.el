;-------;
; REPO  ;
;-------;
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
 
(package-initialize)
 
;make sure the packages are installed; if not install them
(mapc
 (lambda (package)
   (or (package-installed-p package)
       (package-install package)
   )
   )
 '

; generated by C-h v package-activated-list
(better-defaults better-defaults ac-anaconda dash anaconda-mode f dash s s dash pythonic f dash s s dash auto-complete popup ac-clang yasnippet pos-tip auto-complete popup ac-helm popup auto-complete popup helm helm-core async async ac-html dash f dash s s auto-complete popup ample-theme ample-zen-theme anaconda-mode f dash s s dash pythonic f dash s s dash auctex auto-complete-clang auto-complete popup autopair color-theme-sanityinc-tomorrow cuda-mode darkburn-theme ecb ein request websocket elpy yasnippet pyvenv highlight-indentation find-file-in-project ivy company ergoemacs-mode undo-tree ergoemacs-status mode-icons powerline es-lib exec-path-from-shell find-file-in-project ivy flatland-black-theme flatland-theme flycheck seq let-alist pkg-info epl dash helm-descbinds helm helm-core async async highlight-indentation ivy jedi-direx direx jedi auto-complete popup jedi-core python-environment deferred epc ctable concurrent deferred json-rpc let-alist magit magit-popup dash async git-commit with-editor dash async dash with-editor dash async dash async magit-popup dash async markdown-mode+ markdown-mode markdown-mode matlab-mode mode-icons org php-mode pkg-info epl popup-complete popup pos-tip powerline pretty-lambdada py-autopep8 pydoc pydoc-info python-django python-environment deferred pythonic f dash s s dash pyvenv rainbow-mode request s scss-mode seq smex tidy undo-tree websocket with-editor dash async yasnippet zen-and-art-theme)
)

(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
 
;; call function now
(set-exec-path-from-shell-PATH)

(require 'better-defaults)
;; Enable line numbers in all files. 
 (global-linum-mode 1)

 ;; Enable IDO Mode
 ;; Increases Interactivity and ease of use
 ;; e.g. Autocomplete
 (ido-mode 1)
 (setq ido-enable-flex-matching t)
 (setq ido-everywhere t)
 
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

 ;; Add Solarized Theme
 (add-to-list 'custom-theme-load-path "~/emacsBackup/.emacs.d/themes/emacs-color-theme-solarized")
  

 ;; Start with subword mode on
 ;; easier navigation of camelCase
 (load "subword.el")
 (global-subword-mode 1)

 ;; Turn on Visible Mark
 (add-to-list 'load-path "~/emacsBackup/.emacs.d/general-tools/")
 (load "visible-mark.el")

;; Load extra help commands
 (load "help-fns+.el")

 ;; Turn on Whitespace Mode
 (require 'whitespace)
 (setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)
(setq whitespace-global-modes '(c-mode c++-mode cuda-mode web-mode python-mode php-mode))

 ;; Enable Smart Scan Mode
 ;; Quickly search for identifier at current point
 (load "smartscan.el")
 (smartscan-mode 1)

 ;; Disable GUI items
 (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
 (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
 (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

 ;;Store all backup files in C:/Temp
 (setq backup-directory-alist
   `((".*" . ,temporary-file-directory)))
 (setq auto-save-file-name-transforms
   `((".*" ,temporary-file-directory t)))
(put 'set-goal-column 'disabled nil)

;;Swap Windows & Frames quickly
(setq windmove-wrap-around t)
(global-set-key (kbd "M-s M-f") 'windmove-up)
(global-set-key (kbd "M-s M-s") 'windmove-down)
(global-set-key (kbd "M-s M-r") 'windmove-left)
(global-set-key (kbd "M-s M-t") 'windmove-right)
(global-set-key (kbd "M-s M-c") 'other-frame)

(global-set-key (kbd "<Shift-up>") 'windmove-up)
(global-set-key (kbd "<Shift-down>") 'windmove-down)
(global-set-key (kbd "<Shift-left>") 'windmove-left)
(global-set-key (kbd "<Shift-right>") 'windmove-right)





 ;;Set up Web-Mode for syntax highlighting

 (add-to-list 'load-path "~/emacsBackup/.emacs.d/syntax-modes/")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vtl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode));; Set PHP-Mode for php files.

(add-to-list 'auto-mode-alist '("\\.cu$" . cuda-mode))
(add-to-list 'auto-mode-alist '("\\.upc$" . c++-mode))



(add-hook 'web-hook 'my-web-mode-hook)

(setq-default rainbow-mode 1)
(setq django-indent-width 4)

 ;;Display tabs as 4 spaces.
 (setq-default tab-width 4)
    (defvaralias 'c-basic-offset 'tab-width)
    (defvaralias 'cperl-indent-level 'tab-width)

 ;;Next line moves to next ACTUAL line
 ;;ignores word wrap
 (setq line-move-visual 'nil)

 (define-key minibuffer-local-map "\M-s" nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(ansi-term-color-vector [unspecified "#393939" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#6699cc" "#e8e6df"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(cursor-color "#839496")
 '(custom-safe-themes (quote ("769bb56fb9fd7e73459dcdbbfbae1f13e734cdde3cf82f06a067439568cdaa95" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4eaad15465961fd26ef9eef3bee2f630a71d8a4b5b0a588dc851135302f69b16" "2b5aa66b7d5be41b18cc67f3286ae664134b95ccc4a86c9339c886dfd736132d" "ed81411169b1b3e3d4cfc39b09d68ea13e0ff7708dc5b9d0bedb319e071968ad" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" "978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "17034e7e911c6dced02ff9ed23bae2967b94f2585a7c942afbfae936b9e40a61" "9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" default)))
 '(fci-rule-color "#383838")
 '(foreground-color "#839496")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;                              ORG MODE                           ;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;SET UP ORG MODE
 (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

 ;;Define Default Workflow States
 (setq org-todo-keywords
	   '((sequence "TODO" "NOW" "DONE")))

;; set key for agenda

(define-key global-map "\C-cl" 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-log-done t)

;;file to save todo items
(setq org-agenda-files (quote ("~/org/todo.org" "~/Documents/filmGrammar/todo.org")))

;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?A)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;;capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
		 "* TODO [#B] %? :%^{Tags}:\n:Created: %U\n"  ; template
		 :prepend t        ; properties
		 :empty-lines 1    ; properties
		 :created t        ; properties
		 )
		("j" "Journal" entry (file+datetree "~/org/journal.org")
		 "* %?"
		 :empty-lines 1)
		("n" "Note" entry (file+headline "~/org/notes.org" "Notes")
         "* %?\nEntered on %U\n  %i\n  %a")
		("f" "filmgrammar todo" entry (file+headline "~/Documents/filmGrammar/todo.org" "Tasks")
		 "* TODO [#B] %? :%^{Tags}:filmgrammar:ucb:research:code:work:\n:Created: %U\n"  ; template
		 :prepend t        ; properties
		 :empty-lines 1    ; properties
		 :created t        ; properties
		 )
		))

(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t))
          t)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-agenda-mode-hook
          (lambda ()
            (visual-line-mode -1)
            (toggle-truncate-lines 1)))

;;Mac key rebinds
  (setq mac-option-modifier 'control)
  (setq mac-command-modifier 'meta)
  (setq mac-control-modifier 'super)

;;Set up autocomplete
 ;;Add autocomplete for coding
 (add-to-list 'load-path "~/emacsBackup/.emacs.d/general-tools/")
 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools//ac-dict")



 (add-to-list 'load-path "~/emacsBackup/.emacs.d/auto-complete-1.3.1")

 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/ac-dict")
 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/ac-clang")
 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/ac-anaconda")
 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/ac-helm")
 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/ac-html")

;;Autocomplete Config
  (require 'auto-complete)
 (require 'auto-complete-config)
 (ac-config-default)
 (global-auto-complete-mode t)



 ;;Python Mode
;;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
 (add-hook 'python-mode-hook 'my-python-mode-hook)
(defun my-python-mode-hook ()
  (rainbow-mode 1)
  (anaconda-mode 1)
  )

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(elpy-enable)

(require 'py-isort)
(add-hook 'before-save-hook 'py-isort-before-save)

;;iPython Notebook
 (autoload 'ein "ein")
(require 'python-django) 
;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)



(require 'cc-mode)


;; AucTeX
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)
  (setq TeX-PDF-mode t)
  
  ;; Use Skim as viewer, enable source <-> PDF sync
  ;; make latexmk available via C-c C-c
  ;; Note: SyncTeX is setup via ~/emacsBackup/.latexmkrc (see below)
  (add-hook 'LaTeX-mode-hook (lambda ()
    (push
      '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
        :help "Run latexmk on file")
      TeX-command-list)))
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))
  
  ;; use Skim as default pdf viewer
  ;; Skim's displayline is used for forward search (from .tex to .pdf)
  ;; option -b highlights the current line; option -g opens Skim in the background  
  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  (setq TeX-view-program-list
       '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

    

 ;;Markdown Mode
    (autoload 'markdown-mode "markdown-mode"
       "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; display “lambda” as “λ”
 (global-prettify-symbols-mode 1)
(electric-pair-mode +1)

(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\{ . ?\})
                            ) )

(add-hook
   'web-mode-hook
   '(lambda ()
      (setq web-mode-enable-auto-pairing nil)
      (setq-local
       electric-pair-pairs
       (append electric-pair-pairs '((?% . ?%))))))



 

;;tell tramp to use ssh
(setq tramp-default-method "ssh")

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



;; Force frame to 80 column width

(defun set-window-width (n)
  "Set the selected window's width."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun set-80-columns ()
  "Set the selected window to 80 columns."
  (interactive)
  (set-window-width 80))

(global-set-key "\C-x~" 'set-80-columns)



(setq debug-on-error t)
