;;; emacs wrapper for https://github.com/mix86/deploy

(defun deploy-message (process event)
  (message "Deploing project... Done."))

(defun my-deploy (&rest args)
  (interactive)
  (message "Deploing project... ")
  (save-buffer (current-buffer))
  (apply 'start-process
         (append ["deploy-process" "*Deploy*" "deploy.sh"] args))
  (set-process-sentinel (get-process "deploy-process") 'deploy-message))

(defun my-reverse-deploy ()
  (interactive)
  (my-deploy "--reverse"))

(global-set-key (kbd "C-c M-r") 'my-reverse-deploy)
(global-set-key (kbd "C-c M-b") 'my-deploy)
(add-hook 'after-save-hook 'my-deploy)
