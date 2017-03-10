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
  (ac-anaconda dash anaconda-mode f dash s s dash pythonic f dash s s dash auto-complete popup ac-clang yasnippet pos-tip auto-complete popup ac-helm popup auto-complete popup helm helm-core async popup async ac-html dash f dash s s auto-complete popup ample-theme ample-zen-theme anaconda-mode f dash s s dash pythonic f dash s s dash auctex auto-complete-clang auto-complete popup autopair better-defaults color-theme-sanityinc-tomorrow cuda-mode darkburn-theme ecb ein cl-generic request websocket elpy s yasnippet pyvenv highlight-indentation find-file-in-project ivy company ergoemacs-mode undo-tree ergoemacs-status mode-icons powerline es-lib exec-path-from-shell find-file-in-project ivy flatland-black-theme flatland-theme flycheck seq let-alist pkg-info epl dash helm-descbinds helm helm-core async popup async helm-org-rifle s helm helm-core async popup async f dash s dash helm-projectile projectile pkg-info epl helm helm-core async popup async highlight-indentation ivy jedi-direx direx jedi auto-complete popup jedi-core python-environment deferred epc ctable concurrent deferred json-rpc let-alist magit magit-popup dash async git-commit with-editor dash async dash with-editor dash async dash async magit-popup dash async markdown-mode+ markdown-mode markdown-mode matlab-mode mode-icons org-mobile-sync org php-mode popup-complete popup pos-tip powerline pretty-lambdada projectile pkg-info epl py-autopep8 py-isort pydoc pydoc-info python-django python-environment deferred pythonic f dash s s dash pyvenv rainbow-mode request s scss-mode seq smex tidy undo-tree websocket with-editor dash async yasnippet zen-and-art-theme)
  
);; close the package automanagement function


(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
 
;; call function now
(unless (string-equal system-type "windows-nt") ; Microsoft Windows
    (set-exec-path-from-shell-PATH))
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

 ;; Add Solarized Theme
 (add-to-list 'custom-theme-load-path "~/emacsBackup/.emacs.d/themes/emacs-color-theme-solarized")
  
;;Mac key rebinds
  (setq mac-option-modifier 'control)
  (setq mac-command-modifier 'meta)

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
 (autoload 'whitespace "whitespace")
 (setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)
(setq whitespace-global-modes '(c-mode c++-mode cuda-mode web-mode python-mode php-mode))

 ;; Enable Smart Scan Mode
 ;; Quickly search for identifier at current point
 (load "smartscan.el")
 (smartscan-mode 1)


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
(autoload 'web-mode "web mode")
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vtl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode));; Set PHP-Mode for php files.
(add-to-list 'auto-mode-alist '("\\.cu$" . cuda-mode))
(add-to-list 'auto-mode-alist '("\\.upc$" . c++-mode))

;; My custom creative writing file format
(add-to-list 'auto-mode-alist '("\\.ink$" . org-mode))


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


  (setq mac-control-modifier 'super)

;;Set up autocomplete

;;Autocomplete Config
  (autoload 'auto-complete "autocomplete")
 (autoload 'auto-complete-config "autocomplete config")
 (ac-config-default)
 (global-auto-complete-mode t)

 ;;Add autocomplete for coding
 (add-to-list 'load-path "~/emacsBackup/.emacs.d/general-tools/")

 (add-to-list 'load-path "~/emacsBackup/.emacs.d/auto-complete-1.3.1")

 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools/ac-dict")
 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools/ac-clang")
 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools/ac-anaconda")
 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools/ac-helm")
 (add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools/ac-html")


 ;;Python Mode
;;(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
 (add-hook 'python-mode-hook 'my-python-mode-hook)
(defun my-python-mode-hook () 
  (rainbow-mode 1)
  )

(elpy-enable)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


(autoload 'py-isort "python isort")
(add-hook 'before-save-hook 'py-isort-before-save)

;;iPython Notebook
 (autoload 'ein "ein")
(autoload 'python-django "python-django") 
;; enable autopep8 formatting on save
(autoload 'py-autopep8 "autopep8")
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)



(autoload 'cc-mode "cc-mode")


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

;;(use-package ivy :ensure t
;;  :diminish (ivy-mode . "")
;;  :bind
;;  (:map ivy-mode-map
;;   ("C-'" . ivy-avy))
;;  :config
;;  (ivy-mode 1)
;;  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
;;  (setq ivy-use-virtual-buffers t)
;;  ;; number of result lines to display
;;  (setq ivy-height 10)
;;  ;; does not count candidates
;;  (setq ivy-count-format "")
;;  ;; no regexp by default
;;  (setq ivy-initial-inputs-alist nil)
;;  ;; configure regexp engine.
;;  (setq ivy-re-builders-alist
;;	;; allow input not in order
;;        '((t   . ivy--regex-ignore-order))))
;;;; Projectile Mode
(setq projectile-mode t)

;; HELM setup
(require 'helm)
(setq helm-ff-transformer-show-only-basename nil
      helm-adaptive-history-file             "~/emacsBackup/.emacs.d/data/helm-history"
      helm-yank-symbol-first                 t
      helm-move-to-line-cycle-in-source      t
      helm-buffers-fuzzy-matching            t
      helm-ff-auto-update-initial-value      t)

(autoload 'helm-descbinds      "helm-descbinds" t)
(autoload 'helm-eshell-history "helm-eshell"    t)
(autoload 'helm-esh-pcomplete  "helm-eshell"    t)
(helm-autoresize-mode t)
(global-set-key (kbd "C-h a")    #'helm-apropos)
(global-set-key (kbd "C-h i")    #'helm-info-emacs)
(global-set-key (kbd "C-h b")    #'helm-descbinds)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "TAB")     #'helm-esh-pcomplete)
              (define-key eshell-mode-map (kbd "C-c C-l") #'helm-eshell-history)))

(global-set-key (kbd "C-x b")   #'helm-mini)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-r") #'helm-recentf)
(global-set-key (kbd "C-x r l") #'helm-filtered-bookmarks)
(global-set-key (kbd "M-y")     #'helm-show-kill-ring)
(global-set-key (kbd "M-s o")   #'helm-swoop)
(global-set-key (kbd "M-s /")   #'helm-multi-swoop)

(require 'helm-config)
(helm-mode t)
(helm-adaptive-mode t)

(global-set-key (kbd "C-x c!")   #'helm-calcul-expression)
(global-set-key (kbd "C-x c:")   #'helm-eval-expression-with-eldoc)
(define-key helm-map (kbd "M-o") #'helm-previous-source)

(global-set-key (kbd "M-s s")   #'helm-ag)

(autoload 'helm-projectile "helm projectile")
(setq helm-projectile-sources-list (cons 'helm-source-projectile-files-list
                                         (remove 'helm-source-projectile-files-list 
                                              helm-projectile-sources-list)))
(helm-projectile-on)

(define-key projectile-mode-map (kbd "C-c p /")
  #'(lambda ()
      (interactive)
      (helm-ag (projectile-project-root))))

(add-hook 'org-mode-hook
          (lambda ()
            (define-key org-mode-map (kbd "C-x c o h") #'helm-org-headlines)))

(autoload 'helm-flyspell "helm-flyspell")
(autoload 'flycheck "flycheck")
;; add flyspell correction to helm
(add-hook 'after-init-hook #'global-flycheck-mode)
(define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct)
(define-key flycheck-mode-map (kbd "C-;") 'helm-flycheck)

(global-set-key "\C-cC-r" 'helm-org-rifle-org-directory)
(global-set-key "\C-cr" 'helm-org-rifle)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(setq helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window

      helm-echo-input-in-header-line t) ;; input close to where I type

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
      'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

;; End helm setup

;; Adapted From Better Defaults.el
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

  (autoload 'uniquify "uniquify")
  (setq uniquify-buffer-name-style 'forward)

  (autoload 'saveplace "saveplace")
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

;;; better-defaults.el ends here


;; Setup magit
(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "C-x g") 'magit-status)




;;SET UP ORG MODE
 (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

 ;;Define Default Workflow States
 (setq org-todo-keywords
	   '((sequence "TODO" "DONE")))

;; set key for agenda

(define-key global-map "\C-cl" 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-log-done t)

;;file to save todo items
(setq org-agenda-files (quote ("~/Dropbox/org/")))

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
      '(("t" "Todo" entry (file "~/Dropbox/org/todo.org")
		 "* TODO [#B] %? :%^{Tags}:\n:Created: %U\n"  ; template
		 :prepend t        ; properties
		 :empty-lines 1    ; properties
		 :created t        ; properties
		 )
		("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
		 "* %?"
         "* %?\nCreated: %U\n  %i\n  %a"
		 :empty-lines 1)
		("n" "Note" entry (file+datetree "~/Dropbox/org/notes.org")
         "* %?\nCreated: %U\n  %i\n  %a"
        :empty-lines 1)
		("i" "Inbox" entry (file "~/Dropbox/org/inbox.org")
         "* %?\nCreated: %U\n  %i\n  %a"
        :empty-lines 1)
		("f" "filmgrammar todo" entry (file+headline "~/Dropbox/org/research.org" "Tasks")
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
(add-hook 'org-mode-hook 'wc-mode)
(add-hook 'org-agenda-mode-hook
          (lambda ()
            (visual-line-mode -1)
            (toggle-truncate-lines 1)))


(setq org-agenda-custom-commands
      '(
        ("h" "Daily habits" 
         ((agenda ""))
         ((org-agenda-show-log t)
          (org-agenda-ndays 7)
          (org-agenda-log-mode-items '(state))
          (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":DAILY:")))
         );; end "h" view
        ("n" "Agenda and all TODO's"
         (
          ;;Agenda section
          (agenda ""
                     ((org-agenda-overriding-header "This week"))
                  )
          ;; todo section
          (tags-todo "-Wunderlist-habit"
                     ((org-agenda-overriding-header "To Do"))
          )
          ;; Wunderlist Section
          (tags-todo "Wunderlist"
                     ((org-agenda-overriding-header "Wunderlist"))
                     )
          )
         );; end "n" view
        );;end list of custom views
      );end org-agenda-custom-commands call

;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))
;;warn me of any deadlines in next 7 days
(setq org-deadline-warning-days 7)
;;don't show tasks as scheduled if they are already shown as a deadline
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
;;don't give awarning colour to tasks with impending deadlines
;;if they are scheduled to be done
(setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
;;don't show tasks that are scheduled or have deadlines in the
;;normal todo list
(setq org-agenda-todo-ignore-deadlines (quote all))
(setq org-agenda-todo-ignore-scheduled (quote all))
;;sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy
  (quote
   ((agenda habit-down deadline-up time-up priority-down)
    (todo priority-down category-keep)
    (tags priority-down category-keep)
    (search category-keep))))

(autoload 'org-wunderlist "org-wunderlist")
(setq org-wunderlist-client-id "aae80f661b848468d6f9"
      org-wunderlist-token "c463911f3592a80ae4a7e70a0bda6404a9a50fceb23a608a64756d64de1f"
      org-wunderlist-file  "~/Dropbox/org/Wunderlist.org"
      org-wunderlist-dir "~/Dropbox/org/org-wunderlist/")

(setq org-agenda-todo-ignore-scheduled 'future)
(setq org-agenda-tags-todo-honor-ignore-options t)
(setq org-modules '(org-bbdb
                    org-gnus
                    org-info
                    org-habit
                    org-mouse
                    org-protocol
                    org-ref
                    org-wc
                    toc-org
                    org-wunderlist
                    org-irc))

(eval-after-load 'org
 '(org-load-modules-maybe t))
;; Prepare stuff for org-export-backends
(setq org-export-backends '(org latex icalendar html ascii))

(defun ah/org-todo-custom-date (&optional arg)
  "Like org-todo-yesterday, but prompt the user for a date. The time
of change will be 23:59 on that day"
  (interactive "P")
  (let* ((hour (nth 2 (decode-time
               (org-current-time))))
     (daysback (- (date-to-day (current-time-string)) (org-time-string-to-absolute (org-read-date))))
     (org-extend-today-until (+ 1 (* 24 (- daysback 1)) hour))
     (org-use-effective-time t)) ; use the adjusted timestamp for logging
    (if (eq major-mode 'org-agenda-mode)
    (org-agenda-todo arg)
      (org-todo arg))))


;; Mobile Org Setup
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
(setq org-mobile-use-encryption t)
(setq org-mobile-encryption-password "qX4yb12TKykaWx2P")
(setq org-habit-show-habits-only-for-today 1)


(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; turn on mobile org auto syncing. doesn't work with osx yet.
;;(require 'org-mobile-sync)
;;(org-mobile-sync-mode 1)

;; additional org settingss
(autoload 'helm-org-rifle "helm-org-rifle")


(defun my-python-mode-hook () 
  (rainbow-mode 1)
  )


(add-to-list 'org-tag-alist '("TOC" . ?T))
(autoload 'wc-mode "word count mode")


(provide 'init)
