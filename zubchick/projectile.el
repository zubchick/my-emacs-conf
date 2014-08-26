;;; for proper TAGS install ctags from brew
(require 'projectile)

(define-key projectile-mode-map (kbd "M-p") 'projectile-find-file)
(define-key projectile-mode-map (kbd "M-F") 'projectile-ag)

(setq projectile-enable-caching t)
(setq projectile-tags-command
      (concat projectile-tags-command
              " --exclude=\"*.min.*\" --python-kinds=-i"))

(setq projectile-mode-line-lighter "Project")

(projectile-global-mode)

(setq ack-and-a-half-arguments '())     ; хак который нейтрализует баг -_-"
