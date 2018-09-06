(setq windmove-wrap-around t)
(global-set-key (kbd "M-s M-f") 'windmove-up)
(global-set-key (kbd "M-s M-s") 'windmove-down)
(global-set-key (kbd "M-s M-r") 'windmove-left)
(global-set-key (kbd "M-s M-t") 'windmove-right)
(global-set-key (kbd "M-s M-c") 'other-frame)


(defun split-window-horizontally-balanced ()
  (interactive)
  (split-window-horizontally)
  (balance-windows)
  )
(defun split-window-vertically-balanced ()
  (interactive)
  (split-window-vertically)
  (balance-windows)
)
(global-set-key (kbd "C-c 2") 'split-window-vertically-balanced)
(global-set-key (kbd "C-c 3") 'split-window-horizontally-balanced)

;; Winner mode allows reverting and restoring windows configurations with `C-c left' and `C-c right'
(when (fboundp 'winner-mode)
  (winner-mode 1))
