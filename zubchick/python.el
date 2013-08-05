;; python
(defun my-python-hook ()
  (setq py-ident-offset 4
        py-smart-indentation t)

  (setq font-lock-maximum-decoration t)

  ;;idle-highlight
  (idle-highlight-mode t)

  ;;yas
  (yas/load-directory "~/.emacs.d/snippets")
  (flymake-python-pyflakes-load))

(require 'python)
(autoload 'python-mode "python-mode" "Python editing mode." t)
(add-hook 'python-mode-hook 'my-python-hook)
(setq flymake-python-pyflakes-executable "flake8")
(setq flymake-python-pyflakes-extra-arguments '("--ignore=E501"))
