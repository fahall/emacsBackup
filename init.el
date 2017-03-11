;;; init.el --- my initialization file
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/emacsBackup/alex_customizations/")
(load "my_package_management.elc" ) ;; MUST LOAD FIRST

(require 'org-dotemacs)
(setq org-dotemacs-default-file "~/emacsBackup/alex_customizations/.dotemacs.org")
(org-dotemacs-load-default)


;;(load "my_basic_settings.elc" )
;;(load "my_better_defaults.elc")
;;(load "my_window_management.elc")
;;(load "my_syntax_settings.elc")
;;(load "my_auto_complete_settings.elc" )
;;(load "my_project_management.elc" )
;;(load "my_helm.elc")
;;(load "my_org_settings.elc" )
;;(load "my_version_control.elc" )
;;(load "~/emacsBackup/my_ivy.elc") ;; this is a helm replacement candidate

(provide 'init)
;;; init.el ends here
