;;;;;;;;;;;;;;
;; ORG-MODE ;;
;;;;;;;;;;;;;;
;; TIME clocking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-agenda-files
      (file-expand-wildcards "~/orgmode/*.org"))

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
