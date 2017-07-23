;;Store all backup files in C:/Temp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(put 'set-goal-column 'disabled nil)


;; Setup magit
( autoload 'magit-status "magit" nil t)
(global-set-key (kbd "C-x g") 'magit-status)
