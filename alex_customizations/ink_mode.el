;; My custom creative writing file format
(autoload 'wc-mode "wc-mode")
(add-to-list 'auto-mode-alist '("\\.ink$" . org-mode))
(add-hook 'ink-mode-hook '(lambda () (setq electric-pair-mode 0)))
