
;; Godot GDScript settings
(add-to-list 'load-path "~/emacsBackup/.emacs.d/godot-gdscript.el/")
(require 'godot-gdscript)
(require 'company)
(require 'company-godot-gdscript)
(eval-after-load "company"
  '(progn
     (add-to-list 'company-backends 'company-godot-gdscript)))
(add-hook 'godot-gdscript-mode-hook 'company-mode)
;; END Godot GDScript settings
