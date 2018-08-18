;; Where are global org files?

(defvar org-root-directory  "~/Dropbox/org"
  "Path to directory containing global org files used in generating agenda."
  )

(if (string-equal system-type "windows-nt")
  ;; then
  (setq org-root-directory "H:/Dropbox/org")
  ;; else
  (setq org-root-directory "~/Dropbox/org")
  )



;;SET UP ORG MODE
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(let ((default-directory org-root-directory))
  (setq org-agenda-files (list (expand-file-name "todo.org")
							   (expand-file-name "notes.org")
							   (expand-file-name "journal.org")
							   (expand-file-name "research.org")
							   (expand-file-name "Wunderlist.org")
							   (expand-file-name "inbox.org")
							   (expand-file-name "frontera.org"))))
						  


;;Define Default Workflow States

(setq org-todo-keywords
	  '((sequence "IDEA(i)" "TODO(t)" "WAIT(w@/!)" "REVIEW (r@/!)" "|" "DONE(d!)" "CANCELED(c@)")))


(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE|CANCELED" 'agenda))


;; Archive done tasks when refreshing agenda
(advice-add #'org-agenda-redo :before #'org-archive-done-tasks)


;; set key for agenda

(define-key global-map "\C-cl" 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-log-done t)

;;set priority range from A to C with default A
(setq org-highest-priority ?A)
(setq org-lowest-priority ?C)
(setq org-default-priority ?B)

;;set colours for priorities
(setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
                           (?B . (:foreground "LightSteelBlue"))
                           (?C . (:foreground "OliveDrab"))))

;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))

;;capture todo items using C-c c t
(define-key global-map (kbd "C-c c") 'org-capture)


;; org templates
(let ((default-directory org-root-directory))
  (setq org-default-notes-file-path (expand-file-name "notes.org"))
  (setq org-todo-file-path (expand-file-name "todo.org"))
  (setq org-journal-file-path (expand-file-name "journal.org"))
  (setq org-frontera-file-path (expand-file-name "frontera.org"))
  (setq org-research-file-path (expand-file-name "research.org")))


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-todo-file-path "Todo")
		 "* TODO [#B] %? :%^{Tags}:\n:Created: %U\n"  ; template
		 :prepend t        ; properties
		 :empty-lines 1    ; properties
		 :created t        ; properties
		 )
		("j" "Journal" entry (file+datetree org-journal-file-path "Entries")
		 "* %?"
         "* %?\nCreated: %U\n  %i\n  %a"
		 :empty-lines 1)
		("n" "Note" entry (file+datetree org-default-notes-file-path)
         "* %?\nCreated: %U\n  %i\n  %a"
         :empty-lines 1)
		("i" "Inbox" entry (file "~/Dropbox/org/inbox.org")
         "* %?\nCreated: %U\n  %i\n  %a"
         :empty-lines 1)
		("f" "filmgrammar todo" entry (file+headline org-research-file-path "Tasks")
		 "* TODO [#B] %? :%^{Tags}:filmgrammar:ucb:research:code:work:\n:Created: %U\n"  ; template
		 :prepend t        ; properties
		 :empty-lines 1    ; properties
		 :created t        ; properties
		 )
		("d" "Frontera - Idea" entry (file+headline org-frontera-file-path "Ideas")
		 "* IDEA [#B] %? :%^{Tags}:gamedev:frontera:\n:Created: %U\n"  ; template
		 :prepend t        ; properties
		 :empty-lines 1    ; properties
		 :created t        ; properties
		 )
		("c" "Frontera - Task" entry (file+headline org-frontera-file-path "Tasks")
		 "* TODO [#B] %? :%^{Tags}:gamedev:frontera:\n:Created: %U\n"  ; template
		 :prepend t        ; properties
		 :empty-lines 1    ; properties
		 :created t        ; properties
		)))

(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t)
            (visual-line-mode t)
            (wc-mode t)
            )
          t)
(add-hook 'org-agenda-mode-hook
          (lambda ()
            (visual-line-mode -1)
            (toggle-truncate-lines 1)))


(setq org-agenda-custom-commands
      '(
        ("h" "Daily habits" 
         ((agenda ""))
         ((org-agenda-show-log t)
          (org-agenda-ndays 7)
          (org-agenda-log-mode-items '(state))
          (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":DAILY:")))
         );; end "h" view
        ("n" "Agenda and all TODO's"
         (
          ;;Agenda section
          (agenda ""
                  ((org-agenda-overriding-header "This week"))
                  )
          ;; todo section
          (tags-todo "-Wunderlist-habit"
                     ((org-agenda-overriding-header "To Do"))
                     )
          ;; Wunderlist Section
          (tags-todo "Wunderlist"
                     ((org-agenda-overriding-header "Wunderlist"))
                     )
          )
         );; end "n" view
        );;end list of custom views
      );end org-agenda-custom-commands call




;;open agenda in current window
(setq org-agenda-window-setup (quote current-window))
;;warn me of any deadlines in next 7 days
(setq org-deadline-warning-days 7)
;;don't show tasks as scheduled if they are already shown as a deadline
(setq org-agenda-skip-scheduled-if-deadline-is-shown t)
;;don't give awarning colour to tasks with impending deadlines
;;if they are scheduled to be done
(setq org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
;;don't show tasks that are scheduled or have deadlines in the
;;normal todo list
(setq org-agenda-todo-ignore-deadlines (quote all))
(setq org-agenda-todo-ignore-scheduled (quote all))
;;sort tasks in order of when they are due and then by priority
(setq org-agenda-sorting-strategy
      (quote
       ((agenda habit-down deadline-up time-up priority-down)
        (todo priority-down category-keep)
        (tags priority-down category-keep)
        (search category-keep))))

(autoload 'org-wunderlist "org-wunderlist")

(let ((default-directory org-root-directory))
  (setq org-wunderlist-file-path (expand-file-name "Wunderlist.org"))
  (setq org-wunderlist-subdirectory (expand-file-name "org-wunderlist/"))
  (setq org-wunderlist-flagged-file-path (expand-file-name "flagged.org")))

(setq org-wunderlist-client-id "aae80f661b848468d6f9"
      org-wunderlist-token "c463911f3592a80ae4a7e70a0bda6404a9a50fceb23a608a64756d64de1f"
      org-wunderlist-file  org-wunderlist-file-path
      org-wunderlist-dir org-wunderlist-subdirectory)

(setq org-agenda-todo-ignore-scheduled 'future)
(setq org-agenda-tags-todo-honor-ignore-options t)
(setq org-modules '(org-bbdb
                    org-gnus
                    org-info
                    org-habit
                    org-mouse
                    org-protocol
                    org-ref
                    org-wc
                    toc-org
                    org-wunderlist
                    org-irc
                    ))

(eval-after-load 'org
  '(org-load-modules-maybe t))
;; Prepare stuff for org-export-backends
(setq org-export-backends '(org latex icalendar html ascii))

(defun ah/org-todo-custom-date (&optional arg)
  "Like org-todo-yesterday, but prompt the user for a date. The time
of change will be 23:59 on that day"
  (interactive "P")
  (let* ((hour (nth 2 (decode-time
                       (org-current-time))))
         (daysback (- (date-to-day (current-time-string)) (org-time-string-to-absolute (org-read-date))))
         (org-extend-today-until (+ 1 (* 24 (- daysback 1)) hour))
         (org-use-effective-time t)) ; use the adjusted timestamp for logging
    (if (eq major-mode 'org-agenda-mode)
        (org-agenda-todo arg)
      (org-todo arg))))


;; Mobile Org Setup
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-directory org-root-directory)
(setq org-mobile-inbox-for-pull org-wunderlist-flagged-file-path)
(setq org-mobile-use-encryption t)
(setq org-mobile-encryption-password "qX4yb12TKykaWx2P")
(setq org-habit-show-habits-only-for-today 1)
;; turn on mobile org auto syncing. doesn't work with osx yet.
;;(require 'org-mobile-sync)
;;(org-mobile-sync-mode 1)


(provide 'my_org_settings)
