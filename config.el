;; Return a string with complete path of the elisp file to load.
;; Argument: ctx (context)
(defun ajh-load (ctx) (load (concat "~/.emacs.d/" "ajh-" ctx ".el")))

;; Give space to Emacs Garbage Collection to avoid frequently interruptions.
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

;;;;;;;;;;;;;
;; PACKAGE ;;
;;;;;;;;;;;;;
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; MUST BE PLACED AFTER use-package initialization
;; Custom defs for programming languages and modes
(ajh-load "ansible")
(ajh-load "google")
(ajh-load "org")
(ajh-load "projectile")
(ajh-load "python")
(ajh-load "rust")
;; (ajh-load "tracktime")
(ajh-load "web")

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

;; chinese fonts
(use-package cnfonts
             :ensure t)

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

;; define function to display ansi colours for a buffer
;; http://stackoverflow.com/questions/23378271/how-do-i-display-ansi-color-codes-in-emacs-for-any-mode
(use-package ansi-color
  :ensure t
  :init
  (defun display-ansi-colors ()
    (interactive)
    (ansi-color-apply-on-region (point-min) (point-max)))
  )

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

(setq indent-tabs-mode nil)

;; sync parenthesis (){}[]...
(use-package paredit
  :ensure t)

;; aggressive indentation
(use-package aggressive-indent
             :ensure t
             :config
             (global-aggressive-indent-mode t)
             (add-to-list 'aggressive-indent-excluded-modes 'fundamental-mode)
             (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
             (add-hook 'css-mode-hook #'aggressive-indent-mode)
             (add-to-list 'aggressive-indent-excluded-modes 'html-mode))

;; ivy mode
(use-package swiper
             :ensure t)
(use-package ivy
             :after swiper
             :defer 3
             :ensure t
             :config
             (setq ivy-use-virtual-buffers t)
             (setq enable-recursive-minibuffers t)
             ;; enable this if you want `swiper' to use it
             ;; (setq search-default-mode #'char-fold-to-regexp)
             (global-set-key "\C-s" 'swiper)
             (global-set-key (kbd "C-c C-r") 'ivy-resume)
             (global-set-key (kbd "<f6>") 'ivy-resume))

(use-package expand-region
  :ensure t
  :bind ("M-m" . er/expand-region))

;; only y/n to answer
(fset 'yes-or-no-p 'y-or-n-p)

;; help to find the command keys
(use-package which-key
             :ensure t
             :config
             (which-key-mode))

;; Remove annoying minimize shortcut
(global-set-key (kbd "C-z") nil)

;;;;;;;;;;;;;
;; PROJECT ;;
;;;;;;;;;;;;;
(use-package magit
             :ensure t
             :bind (("C-x g" . magit-status))
             :config
             (info-initialize)
             (add-to-list 'Info-directory-list
                          "~/.emacs.d/site-lisp/magit/Documentation/"))

(use-package ido
  :ensure t
  :config
  (setq ido-auto-merge-delay-time 99999999)
  (setq ido-everywhere t)
  (setq ido-virtual-buffers t)
  (ido-mode))

;; Record a note along with the timestamp when state changes from TODO
;; to DONE.
(setq org-log-done 'note)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; remove ^M characters
;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)

;;;;;;;;;;;;;
;; DESKTOP ;;
;;;;;;;;;;;;;
;; use only one desktop
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "emacs-desktop")

;; remove desktop after it's been read
(add-hook 'desktop-after-read-hook
          '(lambda ()
             ;; desktop-remove clears desktop-dirname
             (setq desktop-dirname-tmp desktop-dirname)
             (desktop-remove)
             (setq desktop-dirname desktop-dirname-tmp)))

(defun saved-session ()
  (file-exists-p (concat desktop-dirname "/" desktop-base-file-name)))

;; use session-restore to restore the desktop manually
(defun session-restore ()
  "Restore a saved emacs session."
  (interactive)
  (if (saved-session)
      (desktop-read)
    (message "No desktop found.")))

;; use session-save to save the desktop manually
(defun session-save ()
  "Save an emacs session."
  (interactive)
  (if (saved-session)
      (if (y-or-n-p "Overwrite existing desktop? ")
          (desktop-save-in-desktop-dir)
        (message "Session not saved."))
  (desktop-save-in-desktop-dir)))

;; ask user whether to restore desktop at start-up
(add-hook 'after-init-hook
          '(lambda ()
             (if (saved-session)
                 (if (y-or-n-p "Restore desktop? ")
                     (session-restore)))))
