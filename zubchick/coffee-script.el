(defun my-coffee ()
  (setq coffee-command "/usr/local/bin/coffee")
  (define-key coffee-mode-map (kbd "C-c C-b") 'coffee-compile-buffer)
  (define-key coffee-mode-map (kbd "C-c C-f") 'coffee-compile-file)
  (define-key coffee-mode-map (kbd "C-c C-r") 'coffee-compile-region))

(add-hook 'coffee-mode-hook 'my-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)
