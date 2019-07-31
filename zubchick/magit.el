(defun magit-popup-mode-display-buffer (buffer mode)
  (let ((winconf (current-window-configuration)))
    (split-window-vertically)
    (other-window 1)
    (switch-to-buffer buffer)
    (funcall mode)
    (setq magit-popup-previous-winconf winconf)))


(setq magit-last-seen-setup-instructions "1.4.0"
      magit-push-always-verify nil
      magit-completing-read-function 'magit-ido-completing-read
      ; magit-popup-display-buffer-action '((magit-popup-mode-display-buffer))
      )
