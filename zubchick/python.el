;; python
(defun my-python-hook ()
  (setq py-ident-offset 4
        py-smart-indentation t
        font-lock-maximum-decoration t)

  (idle-highlight-mode t)
  (flymake-mode 0)
  (flycheck-mode t)
  (electric-indent-mode 0)

  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )

(elpy-enable)
(elpy-use-ipython)
(add-hook 'elpy-mode-hook 'my-python-hook)


(when (require 'flycheck nil t)
  (setq elpy-default-minor-modes (delete 'flymake-mode elpy-modules)
        elpy-default-minor-modes (delete 'elpy-module-flymake elpy-modules)
        elpy-default-minor-modes (delete 'elpy-module-highlight-indentation elpy-modules)
        )

  (add-to-list 'elpy-modules 'flycheck-mode))
