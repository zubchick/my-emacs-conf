;; (sml/setup)

(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :config
  (minions-mode 1)
  (setq doom-modeline-buffer-file-name-style 'relative-from-project
        doom-modeline-minor-modes t
        doom-modeline-lsp t))

(doom-modeline-mode)
