(defun my-coffee-hook ()
  (setq tab-width 2)
  (define-key coffee-mode-map (kbd "M-r") 'coffee-compile-region)
  (define-key coffee-mode-map (kbd "M-R") 'coffee-compile-buffer)
  (define-key coffee-mode-map (kbd "C-c M-f") 'coffee-compile-file))

(add-hook 'coffee-mode-hook 'my-coffee-hook)