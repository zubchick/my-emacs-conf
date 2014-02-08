;; python
(defun my-python-hook ()
  (setq py-ident-offset 4
        py-smart-indentation t
        font-lock-maximum-decoration t)

  (idle-highlight-mode t)
  (flycheck-mode t)

  )

(add-hook 'python-mode-hook 'my-python-hook)

;;; jedi
(setq jedi:tooltip-method '(pos-tip))
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)
