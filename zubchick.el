;;; zubchick.el - zubchick's emacs config
(set-face-font 'default "Monaco-14")
(setq visible-bell nil
      scroll-step 1
      require-final-newline t
      ns-command-modifier 'meta
      ns-alternate-modifier nil
      ispell-program-name "/usr/local/bin/aspell"
      initial-frame-alist  '((width . 168) (height . 47))
      x-select-enable-clipboard t)

(global-hl-line-mode t)
(global-hi-lock-mode t)
(menu-bar-mode t)

;; jump-char
(global-set-key (kbd "M-m") 'jump-char-forward)

;; smart C-a
(defun smart-line-beginning ()
  "Move point to the beginning of text on the current line; if that is already
the current position of point, then move it to the beginning of the line."
  (interactive)
  (let ((pt (point)))
    (beginning-of-line-text)
    (when (eq pt (point))
      (beginning-of-line))))
(global-set-key (kbd "C-a") 'smart-line-beginning)

;; DeskTop
(desktop-save-mode t)
(setq history-length 250
      desktop-path '("~/.emacs.d/"))
(add-to-list 'desktop-globals-to-save 'file-name-history)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)

;;  ido-styled
(setq ido-enable-flex-matching t
      ido-use-filename-at-point 'guess)

;;; projectile
(global-set-key (kbd "M-p") 'projectile-find-file)
(projectile-global-mode)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; хоткеи
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "C-c C-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'ibuffer)
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

;; deploy.sh
(defun deploy-message (process event)
  (message "Deploing project... Done."))

(defun my-deploy ()
  (interactive)
  (message "Deploing project... ")
  (save-buffer (current-buffer))
  (start-process "deploy-process" "*Deploy*" "deploy.sh")
  (set-process-sentinel (get-process "deploy-process") 'deploy-message))

(global-set-key (kbd "C-c M-b") 'my-deploy)


;;; lang switcher
;;; http://ru-emacs.livejournal.com/82512.html
(mapcar*
 (lambda (r e) ;; r and e are matching Russian and English keysyms
   ;; iterate over modifiers
   (mapc (lambda (mod)
           (define-key input-decode-map
             (vector (list mod r)) (vector (list mod e))))
         '(control meta super hyper))
   ;; finally, if Russian key maps nowhere, remap it to the English key without
   ;; any modifiers
   (define-key local-function-key-map (vector r) (vector e)))
 "йцукенгшщзхъфывапролджэячсмитьбю"
 "qwertyuiop[]asdfghjkl;'zxcvbnm,.")


;; popwin
(setq display-buffer-function 'popwin:display-buffer)

;;; multi-cursors
(global-set-key (kbd "C-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
