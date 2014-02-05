;; python
(defun my-python-hook ()
  (setq py-ident-offset 4
        py-smart-indentation t
        font-lock-maximum-decoration t)

  (idle-highlight-mode t)
  (flycheck-mode t)

  ;; (flymake-python-pyflakes-load)

  )

;; (autoload 'python-mode "python-mode" "Python editing mode." t)
(add-hook 'python-mode-hook 'my-python-hook)

;;; jedi
(setq jedi:tooltip-method '(pos-tip))
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

;; (setq flymake-python-pyflakes-executable "flake8")
;; (setq flymake-python-pyflakes-extra-arguments '("--ignore=E501,E124,E261"))
