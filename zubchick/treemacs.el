(defun my-treemacs-back-and-forth ()
  (interactive)
  (if (treemacs-is-treemacs-window-selected?)
      (aw-flip-window)
    (treemacs-select-window)))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (treemacs-tag-follow-mode)
  (global-set-key (kbd "M-[") 'treemacs)
  (global-set-key (kbd "M-]") 'my-treemacs-back-and-forth))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)
