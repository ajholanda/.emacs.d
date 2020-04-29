;; source: https://github.com/howardabrams/dot-files/blob/master/emacs-python.org
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)

  :init
  (setq-default indent-tabs-mode nil)

  :config
  (setq python-indent-offset 4)
  (add-hook 'python-mode-hook 'smartparens-mode)
  (add-hook 'python-mode-hook 'color-identifiers-mode))
