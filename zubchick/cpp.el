;;; cpp

(use-package lsp-mode
  :ensure t
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :hook ((lsp-mode-hook . lsp-ui-mode)
         (c++-mode-hook . flycheck-mode-hook))
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
)

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-cache-candidates nil
        company-lsp-async t
        company-transformers nil))

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(defun my-ccls-hook ()
  (require 'ccls)
  (lsp)
  (setq lsp-prefer-flymake nil)
  (flymake-mode 0)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc)))


(use-package ccls
  :ensure t
  :ensure-system-package ccls
  :mode ("\\.h\\'" . c++-mode)
  :hook ((c-mode c++-mode objc-mode) . my-ccls-hook)
  :config
  (setq ccls-sem-highlight-method 'font-lock))
