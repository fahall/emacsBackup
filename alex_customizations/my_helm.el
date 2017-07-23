(require 'helm)
(setq helm-ff-transformer-show-only-basename nil
      helm-adaptive-history-file             "~/emacsBackup/.emacs.d/data/helm-history"
      helm-yank-symbol-first                 t
      helm-move-to-line-cycle-in-source      t
      helm-buffers-fuzzy-matching            t
      helm-ff-auto-update-initial-value      t)

(autoload 'helm-descbinds      "helm-descbinds" t)
(autoload 'helm-eshell-history "helm-eshell"    t)
(autoload 'helm-esh-pcomplete  "helm-eshell"    t)
(helm-autoresize-mode t)

(require 'helm-config)
(helm-mode t)
(helm-adaptive-mode t)

(require 'helm-projectile)
(setq helm-projectile-sources-list (cons 'helm-source-projectile-files-list
                                         (remove 'helm-source-projectile-files-list 
                                              helm-projectile-sources-list)))
(helm-projectile-on)

(define-key projectile-mode-map (kbd "C-c p /")
  #'(lambda ()
      (interactive)
      (helm-ag (projectile-project-root))))

(require 'helm-flyspell)

;; add flyspell correction to helm
(add-hook 'after-init-hook #'global-flycheck-mode)
(define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct)
(define-key flycheck-mode-map (kbd "C-;") 'helm-flycheck)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

;;(setq helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window

  ;;    helm-echo-input-in-header-line t) ;; input close to where I type

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
      'spacemacs//helm-hide-minibuffer-maybe)

;;(setq helm-autoresize-max-height 0)
;;(setq helm-autoresize-min-height 20)
;;(helm-autoresize-mode 1)
(setq helm-idle-delay 0.01)
(setq helm-input-idle-delay 0.01)


;; Now Helm always appears at the bottom, taking full frame width like your trusty ido and has 40% frame height. Adjust the height to your liking.
(add-to-list 'display-buffer-alist
                    `(,(rx bos "*helm" (* not-newline) "*" eos)
                         (display-buffer-in-side-window)
                         (inhibit-same-window . t)
                         (window-height . 0.4)))


(add-to-list 'ac-dictionary-directories "~/emacsBackup/.emacs.d/general-tools/ac-helm")
(autoload 'helm-org-rifle "helm-org-rifle" )
(global-set-key (kbd "C-x c!")   #'helm-calcul-expression)
(global-set-key (kbd "C-x c:")   #'helm-eval-expression-with-eldoc)
(define-key helm-map (kbd "M-o") #'helm-previous-source)

(global-set-key (kbd "M-s s")   #'helm-ag)


(global-set-key (kbd "C-h a")    #'helm-apropos)
(global-set-key (kbd "C-h i")    #'helm-info-emacs)
(global-set-key (kbd "C-h b")    #'helm-descbinds)
(global-set-key (kbd "C-x b")   #'helm-mini)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-r") #'helm-recentf)
(global-set-key (kbd "C-x r l") #'helm-filtered-bookmarks)
(global-set-key (kbd "M-y")     #'helm-show-kill-ring)
(global-set-key (kbd "M-s o")   #'helm-swoop)
(global-set-key (kbd "M-s /")   #'helm-multi-swoop)
(global-set-key "\C-cC-r" 'helm-org-rifle-org-directory)
(global-set-key "\C-cr" 'helm-org-rifle)

(defun helm-find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with
root-privileges (using tramp/sudo), if the file is not writable by
user."
  (interactive)
  (let ((file (helm-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (helm-find-file file)))
;; or some other keybinding...
(global-set-key (kbd "C-c C-x C-f") 'helm-find-file-as-root)

(provide 'my_helm)
(require 'helm-ido-like)
(helm-ido-like)
