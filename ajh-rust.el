(use-package toml-mode
  :ensure t
  )

(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode)

  ;;:hook

  ;; execute before package initialization
  ;;:init
  ;; execute after package initialization
  :config
  (add-hook 'rust-mode-hook
            (lambda () (setq indent-tabs-mode nil)))
  (setq rust-format-on-save t)
  (define-key rust-mode-map (kbd "C-c C-c") 'rust-run)
  )
