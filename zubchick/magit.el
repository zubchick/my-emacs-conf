(use-package magit
  :ensure t
  :init
  (setq magit-last-seen-setup-instructions "1.4.0"
        magit-push-always-verify nil
        magit-completing-read-function 'magit-ido-completing-read)
  :hook magit-svn-mode)
