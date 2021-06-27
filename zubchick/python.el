;; python

(defun my-python-hook ()
  (setq py-ident-offset 4
        py-smart-indentation t
        font-lock-maximum-decoration t)

  (idle-highlight-mode t)
  (flymake-mode 0)
  (flycheck-mode t)
  (highlight-indentation-mode 0)
  (electric-indent-mode 0))

(use-package elpy
  :ensure t
  :init
  (progn
      (setq python-shell-interpreter "python3"
            python-shell-interpreter-args "-m IPython --simple-prompt -i"

            flycheck-python-pycompile-executable "python3"
            flycheck-python-pylint-executable "python3"
            flycheck-python-flake8-executable "python3"
            doom-modeline-python-executable "python3"
            elpy-rpc-python-command "python3")
      (elpy-enable))

  :hook my-python-hook
  :bind (("C-c t" . copy-test-path)))

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(defun copy-test-path ()
  (interactive)
  ;; if you don't use projectile set project-root manually
  (let* ((project-root (projectile-project-root))
        (path (get-test-path project-root)))
    (message path)
    (kill-new path)))

(defun get-test-path (project-root)
  (let* ((file (buffer-file-name))
         (relative (file-relative-name file project-root)))
    (if-let ((defun-name (python-info-current-defun))
             (test-name (replace-regexp-in-string "\\." "::" defun-name)))
        (concat relative "::" test-name)
      relative)))

(exec-path-from-shell-copy-env "PYTHONPATH")
