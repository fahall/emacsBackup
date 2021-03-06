;;; Code
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '(("ELPA" . "http://tromey.com/elpa/") 
  ;;                        ("gnu" . "http://elpa.gnu.org/packages/")
    ;;                      ("marmalade" . "http://marmalade-repo.org/packages/"))) 
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
 (neotree ac-clang ac-helm ac-html ace-window aggressive-indent anaconda-mode auto-complete-clang autopair avy bash-completion better-shell company-auctex auctex company-bibtex company-ghc company-glsl company-irony company-irony-c-headers company-jedi company-lua company-statistics company-web counsel-projectile counsel cuda-mode deadgrep diminish docker-compose-mode dockerfile-mode ecb ein elpy company es-lib esup exec-path-from-shell find-file-in-project flx flycheck-rust ghc ghub glsl-mode go-mode google-c-style graphql haskell-mode highlight-indentation irony ivy-yasnippet jedi-direx direx jedi jedi-core epc ctable concurrent json-rpc lua-mode magit git-commit magit-popup markdown-mode+ matlab-mode mode-icons multiple-cursors omnisharp csharp-mode auto-complete flycheck org-dotemacs org-mobile-sync org-ref key-chord helm-bibtex biblio biblio-core helm helm-core htmlize org-wc org-wunderlist alert log4e gntp paradox hydra lv parsebib pdf-tools pfuture phi-rectangle php-mode polymode popup-complete popup pos-tip powerline py-autopep8 py-isort python-django python-environment pythonic pyvenv rainbow-mode react-snippets request-deferred request deferred rust-mode rustic ht markdown-mode projectile pkg-info epl f s scss-mode shut-up skewer-mode js2-mode simple-httpd smex spinner swiper ivy tablist toc-org transient dash treepy undo-tree use-package bind-key wc-mode web-completion-data websocket with-editor async xterm-color yaml-mode yasnippet-snippets yasnippet)





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
(provide 'my_package_management)
;;; my_package_management.el ends here
