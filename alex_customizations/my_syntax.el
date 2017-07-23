;; web
(autoload 'web-mode "web-mode")
(add-to-list 'load-path "~/emacsBackup/.emacs.d/syntax-modes/")
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

(autoload 'tidy-buffer "tidy" "Run Tidy HTML parser on current buffer" t)
(autoload 'tidy-parse-config-file "tidy" "Parse the `tidy-config-file'" t)
(autoload 'tidy-save-settings "tidy" "Save settings to `tidy-config-file'" t)
(autoload 'tidy-build-menu  "tidy" "Install an options menu for HTML Tidy." t)


 (defun my-tidy-hook () "Customize my html-mode."
   (tidy-build-menu web-mode-map)
   (local-set-key (kbd "C-c t") 'tidy-buffer)
   (setq sgml-validate-command "tidy"))

 (add-hook 'web-mode-hook 'my-tidy-hook)
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




;;Python Mode
(add-hook 'python-mode-hook 'my-python-mode-hook)
(defun my-python-mode-hook () 
  (rainbow-mode 1)
  (elpy-enable)
  (py-autopep8-enable-on-save)
  (jedi:setup)
  (setq jedi:complete-on-dot t)
  
  )
(setq django-indent-width 4)
(autoload 'py-autopep8 "py-autopep8")
(autoload 'py-isort "py-isort")
(require 'py-isort)
;;iPython Notebook
(autoload 'ein "ein")
(autoload 'python-django "python-django") 
;; enable autopep8 formatting on save
(add-hook 'before-save-hook 'py-isort-before-save)

;; end python

(autoload  'cc-mode "cc-mode")
(add-to-list 'auto-mode-alist '("\\.cu$" . cuda-mode))
(add-to-list 'auto-mode-alist '("\\.upc$" . c++-mode))




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
