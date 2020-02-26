;; Give space to Emacs Garbage Collection to avoid frequently interruptions.
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

;;;;;;;
;; C ;;
;;;;;;;
(setq c-default-style "linux"
      c-basic-offset 8)

;;;;;;;;;;;;;
;; PACKAGE ;;
;;;;;;;;;;;;;
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;;;;;;;;;;;
;; VISUAL ;;
;;;;;;;;;;;;
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(global-hl-line-mode +1)
(line-number-mode +1)
(column-number-mode t)
(size-indication-mode t)

(setq inhibit-startup-screen t)

;; greater font size
(set-default-font "Monospace-16")

;; become spaces and tabs visible
(setq whitespace-mode t)

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config))

;; less minor-mode(s) appearing
(use-package diminish
  :ensure t)

(toggle-frame-fullscreen)

;;;;;;;;;;;;;
;; EDITING ;;
;;;;;;;;;;;;;
(add-hook 'before-save-hook 'whitespace-cleanup)
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))

(use-package expand-region
  :ensure t
  :bind ("M-m" . er/expand-region))

(fset 'yes-or-no-p 'y-or-n-p)

;; Remove annoying minimize shortcut
(global-set-key (kbd "C-z") nil)

;;;;;;;;;;;;;
;; PROJECT ;;
;;;;;;;;;;;;;
(use-package magit
	     :ensure t
	     :bind (("C-x g" . magit-status)))
(require 'magit)

;;;;;;;;;;;;;;
;; ORG-MODE ;;
;;;;;;;;;;;;;;
;; TIME clocking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; TODO states and keywords for fast access
(setq org-todo-keywords
'((sequence "TODO(t)" "|" "DONE(d)")
(sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
(sequence "|" "CANCELED(c)")))

;; Record a note along with the timestamp when state changes from TODO
;; to DONE.
(setq org-log-done 'note)

;;;;;;;;;;;;
;; PYTHON ;;
;;;;;;;;;;;;
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 4)))

;;;;;;;;;;;;;;;;;;;;;;;;;
;; remove ^M characters
;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)
