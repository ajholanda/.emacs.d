;;;;;;;;;;;;;;
;; ORG-MODE ;;
;;;;;;;;;;;;;;
;; TIME clocking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-agenda-files
      (file-expand-wildcards "~/orgmode/*.org"))

;; TODO states and keywords for fast access
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))
