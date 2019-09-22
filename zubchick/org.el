;; (use-package org-bullets
;;   :ensure t
;;   :hook ((org-mode-hook . (lambda () (org-bullets-mode 1)))))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
