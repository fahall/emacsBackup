;; Company Mode

(require 'company)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-tooltip-align-annotations 't)          ; align annotations to the right tooltip border
(setq company-idle-delay .1)                         ; decrease delay before autocompletion popup shows
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(global-set-key (kbd "C-c /") 'company-files)        ; Force complete file names on "C-c /" key

(add-hook 'after-init-hook 'global-company-mode)
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))


(eval-after-load
  'company
  '(add-to-list 'company-backends 'company-omnisharp))


(defun omnisharp-format-buffer-on-save()
  (interactive)
  (omnisharp-code-format-entire-file))

(defun my-csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)

  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "stroustrup")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)

  ;csharp-mode README.md recommends this too
  ;(electric-pair-mode 1)       ;; Emacs 24
  (electric-pair-local-mode 1) ;; Emacs 25
  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile)
  (setq-local 'omnisharp-format-on-keystroke t)
  )


  (add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)

(add-hook 'python-mode-hook 'my/python-mode-hook)
(add-hook 'csharp-mode-hook 'omnisharp-mode)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'web-mode-hook 'company-web)


;; Quickly search for identifier at current point
(load "smartscan.el")
(smartscan-mode 1)
(add-to-list 'load-path "~/emacsBackup/.emacs.d/general-tools/")


(autoload 'company-bibtex "company-bibtex")
(add-to-list 'company-backends 'company-bibtex)
(autoload 'company-auctex "company-auctex")
(company-auctex-init)


;; Download & build `glslangValidator' from KhronosGroup:
;; https://github.com/KhronosGroup/glslang

(use-package company-glsl
  :config
  (when (executable-find "glslangValidator")
    (add-to-list 'company-backends 'company-glsl)))

(add-to-list 'company-backends 'company-ghc)


(add-hook 'after-init-hook #'company-statistics-mode)


(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
