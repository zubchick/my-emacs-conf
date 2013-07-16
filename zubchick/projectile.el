;;; for proper TAGS install ctags from brew
(require 'projectile)

(define-key projectile-mode-map (kbd "M-p") 'projectile-find-file)
(define-key projectile-mode-map (kbd "M-F") 'projectile-ack)
(add-hook 'prog-mode-hook
          (lambda () (require 'popwin)
            (push '("*Ack-and-a-half*" :height 25)
                  popwin:special-display-config)))

(setq projectile-enable-caching t)
(setq projectile-tags-command
      "ctags --exclude=\"*.min.*\" --python-kinds=-i -Re %s %s")

(projectile-global-mode)
