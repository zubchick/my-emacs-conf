(use-package org-bullets
  :ensure t
  :defer t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
