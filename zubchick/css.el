(setq css-mode-hook nil)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook (lambda () (flycheck-mode 1)))
