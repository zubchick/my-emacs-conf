(use-package dired-details
  :ensure t
  :config
  (put 'dired-find-alternate-file 'disabled nil)
  (dired-details-install))
