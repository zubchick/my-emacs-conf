(require 'gud)                          ; loads lldb patch

(defun my-rust-mode-hook ()
  (define-key rust-mode-map (kbd "TAB")
    #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  (setq racer-rust-src-path "/Users/zubchick/workspace/rust/src")
  (flycheck-mode t)
  (gud-tooltip-mode t)
  )

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'toml-mode-hook
          (lambda () (if (string-match "Cargo.toml$"
                                  (buffer-file-name (current-buffer)))
                    (cargo-minor-mode t))))
(add-hook 'rust-mode-hook 'my-rust-mode-hook)
(add-hook 'rust-mode-hook #'racer-mode)

(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
