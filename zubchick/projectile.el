;;; projectile.el

(use-package projectile-ripgrep
  :ensure t
  :ensure-system-package (rg . ripgrep))

(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  :config
  (define-key projectile-mode-map (kbd "M-p") 'projectile-find-file)
  (define-key projectile-mode-map (kbd "M-F") 'projectile-ripgrep)
  (setq ripgrep-arguments (list "--smart-case")))
