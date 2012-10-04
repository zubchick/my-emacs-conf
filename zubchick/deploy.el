(defun deploy-message (process event)
  (message "Deploing project... Done."))

(defun my-deploy ()
  (interactive)
  (message "Deploing project... ")
  (save-buffer (current-buffer))
  (start-process "deploy-process" "*Deploy*" "deploy.sh")
  (set-process-sentinel (get-process "deploy-process") 'deploy-message))

(global-set-key (kbd "C-c M-b") 'my-deploy)
