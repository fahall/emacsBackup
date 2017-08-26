;; My custom creative writing file format
(add-to-list 'auto-mode-alist '("\\.ink$" . org-mode))
(add-hook 'ink-mode-hook '(lambda () (setq electric-pair-mode 0)))
