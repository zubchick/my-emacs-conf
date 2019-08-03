;; python
(require 'python)
(require 'projectile)

(defun my-python-hook ()
  (setq py-ident-offset 4
        py-smart-indentation t
        font-lock-maximum-decoration t)

  (idle-highlight-mode t)
  (flymake-mode 0)
  (flycheck-mode t)
  (electric-indent-mode 0))

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :hook my-python-hook
  :bind (("C-c t" . copy-test-path)))


(when (require 'flycheck nil t)
  (setq elpy-default-minor-modes (delete 'flymake-mode elpy-modules)
        elpy-default-minor-modes (delete 'elpy-module-flymake elpy-modules)
        elpy-default-minor-modes (delete 'elpy-module-highlight-indentation elpy-modules)
        )

  (add-to-list 'elpy-modules 'flycheck-mode))

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
