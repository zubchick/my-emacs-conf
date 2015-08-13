(defun my-haskell-hook ()
  (flycheck-mode t)
  (cua-selection-mode t)

  (local-set-key (kbd "C-c <") 'haskell-move-nested-left)
  (local-set-key (kbd "C-c >") 'haskell-move-nested-right)
  (local-set-key (kbd "C-c C-c") 'haskell-compile)
  (local-set-key (kbd "C-c C-z") 'haskell-interactive-switch)
  (local-set-key (kbd "C-c C-l") 'haskell-process-load-file)
  (local-set-key (kbd "C-c C-t") 'haskell-process-do-type)
  (local-set-key (kbd "C-c C-i") 'haskell-process-do-info)
)

(add-hook 'haskell-mode-hook 'my-haskell-hook)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)

(add-hook 'haskell-cabal-mode
          (lambda ()
            (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile)))

(add-hook 'haskell-interactive-mode (lambda () (whitespace-mode -1)))
