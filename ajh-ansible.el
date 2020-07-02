(use-package ansible
  :ensure t
  :config
  (add-hook 'yaml-mode-hook '(lambda () (ansible 1))))
