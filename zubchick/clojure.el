(defun slime-java-describe (symbol-name)
  "Get details on Java class/instance at point."
  (interactive (list (slime-read-symbol-name "Java Class/instance: ")))
  (when (not symbol-name)
    (error "No symbol given"))
  (save-excursion
    (set-buffer (slime-output-buffer))
    (unless (eq (current-buffer) (window-buffer))
      (pop-to-buffer (current-buffer) t))
    (goto-char (point-max))
    (insert (concat "(clojure.pprint/pprint (clojure.reflect/reflect "
                    symbol-name "))"))
    (when symbol-name
      (slime-repl-return)
      (other-window 1))))

(defun slime-javadoc (symbol-name)
  "Get JavaDoc documentation on Java class at point."
  (interactive (list (slime-read-symbol-name "JavaDoc info for: ")))
  (when (not symbol-name)
    (error "No symbol given"))
  (set-buffer (slime-output-buffer))
  (unless (eq (current-buffer) (window-buffer))
    (pop-to-buffer (current-buffer) t))
  (goto-char (point-max))
  (insert (concat "(clojure.java.javadoc/javadoc " symbol-name ")"))
  (when symbol-name
    (slime-repl-return)
    (other-window 1)))

(defun my-clojure-mode-hook ()
  "Hook for Clojure mode"
  (setq slime-net-coding-system 'utf-8-unix)
  (idle-highlight-mode t)
  (clojure-test-maybe-enable)
  (require 'highlight-parentheses)
  (highlight-parentheses-mode t)
  (define-key slime-mode-map (kbd "C-c d") 'slime-java-describe)
  (define-key slime-repl-mode-map (kbd "C-c d") 'slime-java-describe)
  (define-key slime-mode-map (kbd "C-c D") 'slime-javadoc)
  (define-key slime-repl-mode-map (kbd "C-c D") 'slime-javadoc)
  (define-key clojure-mode-map (kbd "RET") 'paredit-newline)
  (global-set-key (kbd "C-c s") 'slime-selector))

(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode t)))
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
