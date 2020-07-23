;;;;;;;;;;;;;;
;; ORG-MODE ;;
;;;;;;;;;;;;;;
;; TIME clocking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-agenda-files
      (file-expand-wildcards "~/orgmode/*.org"))

;; Agenda files
(setq org-agenda-files '("~/orgmode/inbox.org"
                         "~/orgmode/current.org"
                         "~/orgmode/tickler.org"))

;; Refile target
(setq org-refile-targets '(("~/orgmode/current.org" :maxlevel . 3)
		           ("~/orgmode/next.org" :level . 1)
		           ("~/gtd/tickler.org" :maxlevel . 2)))

;; Org capture
(setq org-capture-templates '(("t" "Todo [inbox]" entry
	(file+headline "~/orgmode/inbox.org" "Tasks")
	"* TODO %i%?")
	("T" "Tickler" entry
	(file+headline "~/orgmode/tickler.org" "Tickler")
	"* %i%? \n %U")))

;; TODO keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "ABORTED(a)")))

;; TODO faces
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "medium blue" :weight bold)
              ("APPT" :foreground "medium blue" :weight bold)
              ("ABORTED" :foreground "dark red" :weight bold)
              ("NOTE" :foreground "dark violet" :weight bold)
              ("STARTED" :foreground "dark orange" :weight bold)
              ("WAITING" :foreground "red" :weight bold)
              ("DONE" :foreground "dark green" :weight bold)
              ("DELEGATED" :foreground "red" :weight bold))))
