;;; init.el --- my initialization file
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/emacsBackup/alex_customizations/")
(load "my_package_management.el" ) ;; MUST LOAD FIRST


(require 'org-dotemacs)
(setq org-dotemacs-default-file "~/emacsBackup/alex_customizations/.dotemacs.org")
(org-dotemacs-load-default)


(provide 'init)
;;; init.el ends here
