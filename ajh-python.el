;; source: https://github.com/howardabrams/dot-files/blob/master/emacs-python.org
(setq python-tab-width 4)

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python3" . python-mode)

  ;; execute before package initialization
  :init
  (setq-default indent-tabs-mode nil)
 
  ;; execute after package initialization
  :config
  (setq python-indent-offset python-tab-width)
  (add-hook 'python-mode-hook 'smartparens-mode)
)
