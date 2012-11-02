(require 'projectile)
(setq projectile-tags-command
      "find %s -type f -print | egrep -v \"/[.][a-zA-Z]\" | etags -")
(define-key projectile-mode-map (kbd "M-p") 'projectile-find-file)
(define-key projectile-mode-map (kbd "M-F") 'projectile-grep)
(projectile-global-mode)
