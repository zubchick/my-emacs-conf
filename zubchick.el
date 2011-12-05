;;; zubchick.el - zubchick's emacs config

(custom-set-variables
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(default-input-method "russian-computer")
 '(display-time-mode t)
 '(menu-bar-mode t)
 '(mac-command-modifier 'meta) ; cmd - meta
 '(mac-option-modifier 'none)
 '(visible-bell nil)
 '(x-select-enable-clipboard t)
 '(initial-frame-alist '((width . 168) (height . 47))) ;; frame window size
 )
(set-face-font 'default "Monaco-14")

;; clojure hack
(setenv "PATH" (concat "/Users/zubchick/bin:" (shell-command-to-string "echo $PATH")))

(global-hl-line-mode 1) ; подсветка текущей строки

;; DeskTop
(desktop-save-mode 1)
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)
(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

;; whitespace
(setq py-ident-offset 4
      py-smart-indentation t
      whitespace-style '(trailing lines-tail space-after-tab space-before-tab)
      whitespace-line-column 80)

(require 'whitespace)

;;  ido-styled
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)

;; хоткеи
(global-set-key (kbd "M-p") 'ftf-find-file)
(global-set-key (kbd "M-F") 'ftf-grepsource)
(global-set-key (kbd "M-z") 'undo) ;; undo
(global-set-key (kbd "C-c C-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; более удобный переключатель буферов
(global-set-key (kbd "\e M-SPC") 'just-one-space)
(global-set-key (kbd "RET") 'newline-and-indent)

;; отключаем СТРЕЛОЧКИ
;; (global-unset-key (kbd "<right>"))
;; (global-unset-key (kbd "<left>"))
;; (global-unset-key (kbd "<up>"))
;; (global-unset-key (kbd "<down>"))

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
  (toggle-read-only 1)
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

;; Прокрутка
(setq scroll-step 1) ; шаг скролла

;; tabs
(require 'tabbar)
(setq EmacsPortable-global-tabbar 't)
(require 'tabbar-ruler)

(when (require 'tabbar nil t)
  (setq tabbar-buffer-groups-function
    	(lambda () (list "All Buffers")))
  (setq tabbar-buffer-list-function
    	(lambda ()
    	  (remove-if
    	   (lambda(buffer)
    	     (find (aref (buffer-name buffer) 0) " *"))
    	   (buffer-list))))
  (tabbar-mode))

(global-set-key (kbd "C-.") 'tabbar-forward-tab)
(global-set-key (kbd "C-,") 'tabbar-backward-tab)

;; uniquify - у файлов с одинаковым именем пишется еще и папка
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Git
(autoload 'magit-status "magit" nil t)

;; clojure
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
    (insert (concat "(clojure.contrib.repl-utils/show " symbol-name ")"))
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
  (insert (concat "(clojure.contrib.javadoc/javadoc " symbol-name ")"))
  (when symbol-name
    (slime-repl-return)
    (other-window 1)))

(defun my-clojure-mode-hook ()
  "Hook for Clojure mode"
  (whitespace-mode 1)
  (clojure-test-maybe-enable)
  (define-key slime-mode-map (kbd "C-c d") 'slime-java-describe)
  (define-key slime-repl-mode-map (kbd "C-c d") 'slime-java-describe)
  (define-key slime-mode-map (kbd "C-c D") 'slime-javadoc)
  (define-key slime-repl-mode-map (kbd "C-c D") 'slime-javadoc)
  (define-key clojure-mode-map (kbd "RET") 'paredit-newline))

(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode t)))

;; python
(add-to-list 'load-path "~/.emacs.d/elpa/pysmell-0.7.2/")
(add-to-list 'load-path "~/.emacs.d/elpa/pymacs-0.24/")
(require 'pysmell)
(add-hook 'python-mode-hook (lambda () (pysmell-mode 1)))

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(require 'flymake-cursor)
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (list "~/.emacs.d/zubchick/lintrunner.py"
          (list buffer-file-name)))
  (add-to-list 'flymake-allowed-file-name-masks
               '("^[^\*]+\\.py$" flymake-pylint-init)))
(add-hook 'find-file-hook 'flymake-find-file-hook)


;; coffee scrip
(setq-default tab-width 2)
(defun coffee-custom ()
  "coffee-mode-hook"
;;  (set (make-local-variable 'tab-width) 2)
  (coffee-cos-mode t)

  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
  (define-key coffee-mode-map [(meta R)] 'coffee-compile-region)
  (setq coffee-command "/usr/local/bin/coffee"))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; (add-hook 'coffee-mode-hook 'flymake-coffee-load)

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
                 
