(require 'go-eldoc)
(require 'go-projectile)
(require 'flycheck-gometalinter)
(require 'company)
(require 'company-go)

(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "PATH")

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

(add-hook 'before-save-hook 'gofmt-before-save)
(setq-default gofmt-command "goimports")
(add-hook 'go-mode-hook 'go-eldoc-setup)


(defun my-go-hook ()
  (flycheck-mode t)
  (define-key go-mode-map (kbd "M-.") 'godef-jump)
  (define-key go-mode-map (kbd "C-c h") 'godoc-at-point)
  (define-key go-mode-map (kbd "C-c C-r") 'go-rename)
  (define-key go-mode-map (kbd "C-c C-t") 'go-test-current-file)
  (define-key go-mode-map (kbd "C-c t") 'go-test-current-test)
  (define-key go-mode-map (kbd "M-?") 'go-guru-referrers)

  (setq company-tooltip-limit 20)                      ; bigger popup window
  (setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                          ; remove annoying blinking
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 4)
)

(add-hook 'go-mode-hook 'my-go-hook)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
