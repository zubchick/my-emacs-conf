(defun my-clojure-mode-hook ()
  "Hook for Clojure mode"
  (idle-highlight-mode t)
  (clojure-test-maybe-enable)
  (require 'highlight-parentheses)
  (highlight-parentheses-mode t)
  ;;(define-key clojure-mode-map (kbd "RET") 'paredit-newline)
  (local-set-key (kbd "RET") 'electrify-return-if-match))

(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))


(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)

(add-hook 'clojure-mode-hook #'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
