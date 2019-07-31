;;; for proper TAGS install ctags from brew
(require 'projectile)

(define-key projectile-mode-map (kbd "M-p") 'projectile-find-file)
(define-key projectile-mode-map (kbd "M-F") 'projectile-ripgrep)

(setq ripgrep-arguments (list "--smart-case"))

(setq projectile-enable-caching t
      projectile-tags-command (concat projectile-tags-command
                                      " --exclude=\"*.min.*\" --python-kinds=-i")

      projectile-mode-line-lighter "Project"
      projectile-completion-system 'ido)

(projectile-global-mode)
