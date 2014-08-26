;; python
(defun my-python-hook ()
  (setq py-ident-offset 4
        py-smart-indentation t
        font-lock-maximum-decoration t)

  (idle-highlight-mode t)
  (flycheck-mode t)

  (electric-indent-mode 0)

  )

(add-hook 'python-mode-hook 'my-python-hook)
