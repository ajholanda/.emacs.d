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
            (lambda ()
              (setq indent-tabs-mode nil)
              (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)
              )
            )
;;  (setq rust-format-on-save t)
  (define-key rust-mode-map (kbd "C-c C-c") 'rust-run)
  )

(use-package cargo
  :ensure t
  ;; execute after package initialization
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  )

(use-package flycheck-rust
  :ensure t
  ;; execute after package initialization
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  )
