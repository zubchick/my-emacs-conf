(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-engine 'xetex)
(setq TeX-PDF-mode t)
(setq TeX-view-program-list
      '(("MacViewer" "open %o")))
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-view-program-selection '((output-pdf "MacViewer")
                                               (output-dvi "MacViewer")))))
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(defun flymake-get-tex-args (file-name)
  (list "pdflatex" (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))
