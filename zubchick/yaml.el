(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(setq yaml-indent-offset 4)
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "<enter>" 'newline-and-indent)))
