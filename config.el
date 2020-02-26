;; Give space to Emacs Garbage Collection to avoid frequently interruptions.
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)

;; PACKAGE
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

;; VISUAL
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(global-hl-line-mode +1)
(line-number-mode +1)
(column-number-mode t)
(size-indication-mode t)

(setq inhibit-startup-screen t)

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config))
