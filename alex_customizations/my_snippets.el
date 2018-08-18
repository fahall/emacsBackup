(use-package yasnippet
  :ensure t
  :config(use-package yasnippet-snippets
		   :ensure t)
  (yas-reload-all))

(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/emacsBackup/alex_customizations/my_snippets")))


(dolist (hook '(antlr-mode-hook apples-mode-hook applescript-mode-hook bazel-mode-hook bibtex-mode-hook c++-mode-hook c-lang-common-hook c-mode-hook cc-mode-hook chef-mode-hook cider-repl-mode-hook clojure-mode-hook cmake-mode-hook conf-unix-mode-hook cperl-mode-hook cpp-omnet-mode-hook csharp-mode-hook css-mode-hook d-mode-hook dart-mode-hook dix-mode-hook elixir-mode-hook emacs-lisp-mode-hook enh-ruby-mode-hook ensime-mode-hook erc-mode-hook erlang-mode-hook f90-mode-hook faust-mode-hook git-commit-mode-hook go-mode-hook groovy-mode-hook haskell-mode-hook html-mode-hook java-mode-hook js-mode-hook js2-mode-hook js3-mode-hook kotlin-mode-hook latex-mode-hook lisp-interaction-mode-hook lisp-mode-hook lua-mode-hook m4-mode-hook makefile-automake-mode-hook makefile-bsdmake-mode-hook makefile-gmake-mode-hook makefile-mode-hook malabar-mode-hook markdown-mode-hook nasm-mode-hook ned-mode-hook nesc-mode-hook nix-mode-hook nsis-mode-hook nxml-mode-hook octave-mode-hook org-mode-hook perl-mode-hook php-mode-hook powershell-mode-hook prog-mode-hook protobuf-mode-hook python-mode-hook rst-mode-hook ruby-mode-hook rust-mode-hook scala-mode-hook sh-mode-hook snippet-mode-hook sql-mode-hook swift-mode-hook terraform-mode-hook text-mode-hook tuareg-mode-hook typerex-mode-hook typescript-mode-hook udev-mode-hook web-mode-hook yaml-mode-hook))
  (add-hook hook 'yas-minor-mode))


;; Update yasnippet buffer on change window
;;(defun my-yas-update-hook () "Update yas tables"
;;   (yas-describe-tables))
;;(add-hook 'buffer-list-update-hook 'my-yas-update-hook)

;; (advice-add #'select-window :after #'yas-describe-tables)
(provide 'my_snippets)
