;;; init.el --- my initialization file
;;; Commentary: This master file calls subcomponents in the alex_customizations directory
;;; Code:
(add-to-list 'load-path "~/emacsBackup/alex_customizations/")
(load "my_package_management.el" ) ;; MUST LOAD FIRST
(load "my_basics")
(load "my_window_management")
(load "my_ivy")
(load "my_syntax")
(load "my_org")
(load "my_autocomplete")
(load "my_navigation")
(load "my_project_management")
(load "my_version_control")
(load "my_sandbox")
;;(load "ink_mode")


(provide 'init)
;;; init.el ends here































