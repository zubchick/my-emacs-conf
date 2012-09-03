;;; zubchick.el - zubchick's emacs config
(set-face-font 'default "Monaco-14")

;; DeskTop
(desktop-save-mode t)
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)

;; whitespace
(require 'whitespace)
(setq whitespace-line-column 160)

;; fci
(setq-default fill-column 80)
(setq fci-rule-width 1)
(setq fci-rule-color "lightblue")

;;  ido-styled
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)

;; find-things-fast
(defvar ftf-filetypes '("*") "All files")

;; хоткеи
(global-set-key (kbd "M-p") 'ftf-find-file)
(global-set-key (kbd "M-F") 'ftf-grepsource)
(global-set-key (kbd "M-z") 'undo) ;; undo
(global-set-key (kbd "C-c C-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; более удобный переключатель буферов
(global-set-key (kbd "\e M-SPC") 'just-one-space)
(global-set-key (kbd "RET") 'newline-and-indent)

;; отключаем СТРЕЛОЧКИ
(global-unset-key (kbd "<right>"))
(global-unset-key (kbd "<left>"))
(global-unset-key (kbd "<up>"))
(global-unset-key (kbd "<down>"))

(global-set-key [f2] 'kmacro-call-macro)
(global-set-key [f3] 'kmacro-start-macro-or-insert-counter)
(global-set-key [f4] 'kmacro-end-or-call-macro)

;;Настройка времени и даты
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

(defun prh:kill-current-buffer ()
    (interactive)
    (kill-buffer (current-buffer)))
(global-set-key (kbd "C-c w") 'prh:kill-current-buffer)

(defun copy-line (&optional arg)
  " copy line from current point to the end of line"
  (interactive)
  (toggle-read-only t)
  (kill-line arg)
  (toggle-read-only 0))
(setq-default kill-read-only-ok t)
(global-set-key (kbd "C-c k") 'copy-line)

;; Toggle between saved positions as in MIM editor
(defun save-point-and-switch ()
  "Save current point to register 0 and go
to the previously saved position"
 (interactive)
 (let (temp)
   (setq temp (point-marker))
   (when (not (equal (get-register 0) nil))
     (jump-to-register 0))
   (set-register 0 temp)))

;;Save current position to register 0
(defun save-point-only ()
 "Save current point to register 0"
 (interactive)
 (set-register 0 (point-marker)))

(global-set-key (kbd "\e\e/") 'save-point-and-switch)
(global-set-key (kbd "\e\e?") 'save-point-only)

;; uniquify - for files with same names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Git
(autoload 'magit-status "magit" nil t)


;;; PATH
(setq *PATH* (shell-command-to-string "source $HOME/.zshrc && printf $PATH"))
(if (not (getenv "TERM_PROGRAM"))
       (setenv "PATH" *PATH*))
(setq exec-path (append exec-path (split-string *PATH* ":")))

;; slime
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
  (whitespace-mode t)
  (fci-mode t)
  (clojure-test-maybe-enable)
  (require 'highlight-parentheses)
  (highlight-parentheses-mode t)
  (define-key slime-mode-map (kbd "C-c d") 'slime-java-describe)
  (define-key slime-repl-mode-map (kbd "C-c d") 'slime-java-describe)
  (define-key slime-mode-map (kbd "C-c D") 'slime-javadoc)
  (define-key slime-repl-mode-map (kbd "C-c D") 'slime-javadoc)
  (define-key clojure-mode-map (kbd "RET") 'paredit-newline)
  (global-set-key "\C-cs" 'slime-selector))

(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode t)))

(eval-after-load 'flymake '(require 'flymake-cursor))

;; python
(defun my-python-hook ()
  (whitespace-mode t)
  (fci-mode t)
  (setq py-ident-offset 4
        py-smart-indentation t)

  (require 'linum)
  (linum-mode t)

  ;; (global-font-lock-mode t)
  (setq font-lock-maximum-decoration t)


  ;; flymake
  (when (load "flymake" t)
    (defun flymake-pylint-init ()
      (list "~/.emacs.d/lintrunner.py"
            (list buffer-file-name)))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("^[^\*]+\\.py$" flymake-pylint-init)))
  (add-hook 'find-file-hook 'flymake-find-file-hook)

  ;;idle-highlight
  (idle-highlight-mode t)

  ;;yas
  (yas/load-directory "~/.emacs.d/snippets"))


(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(add-hook 'python-mode-hook 'my-python-hook)


(require 'imenu)
(defun ido-goto-symbol ()
  "Will update the imenu index and then use ido to select a
   symbol to navigate to"
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))

                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))

                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))

                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

(global-set-key (kbd "C-t") 'ido-goto-symbol)

;; uniquify – for uniq buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; html
;; brew install xmlstarlet
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook (lambda () (flyspell-mode 0)))
(add-hook 'html-mode-hook (lambda () (flymake-mode 0)))

;; rainbow partness
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

;; deploy.sh
(defun deploy-message (process event)
  (message "Deploing project... Done."))

(defun my-deploy ()
  (interactive)
  (message "Deploing project... ")
  (save-buffer (current-buffer))
  (start-process-shell-command "deploy-process" "*Deploy*" "deploy.sh")
  (set-process-sentinel (get-process "deploy-process") 'deploy-message))

(global-set-key (kbd "C-c M-b") 'my-deploy)


;; lang switcher
;; http://ru-emacs.livejournal.com/82512.html
(mapcar*
 (lambda (r e) ; R and E are matching Russian and English keysyms
   ; iterate over modifiers
   (mapc (lambda (mod)
    (define-key input-decode-map
      (vector (list mod r)) (vector (list mod e))))
  '(control meta super hyper))
   ; finally, if Russian key maps nowhere, remap it to the English key without
   ; any modifiers
   (define-key local-function-key-map (vector r) (vector e)))
   "йцукенгшщзхъфывапролджэячсмитьбю"
   "qwertyuiop[]asdfghjkl;'zxcvbnm,.")

;; coffee script
(defun my-coffee ()
  (setq coffee-command "/usr/local/bin/coffee")
  (fci-mode t)
  (define-key coffee-mode-map (kbd "C-c C-b") 'coffee-compile-buffer)
  (define-key coffee-mode-map (kbd "C-c C-f") 'coffee-compile-file)
  (define-key coffee-mode-map (kbd "C-c C-r") 'coffee-compile-region)
  (linum-mode t))

(add-hook 'coffee-mode-hook 'my-coffee)
(add-hook 'coffee-mode-hook 'flymake-coffee-load)

;; markdown
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))

;; haskell
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))

;; yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "<enter>" 'newline-and-indent)))
