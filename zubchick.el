;;; zubchick.el - zubchick's emacs config

(set-face-font 'default "Inconsolata LGC:pixelsize=14:weight=normal:slant=normal:width=normal:spacing=100:scalable=true")
(setq default-input-method "UTF-8")
(setq visible-bell nil
      require-final-newline t
      ns-command-modifier 'meta
      ns-alternate-modifier nil
      x-select-enable-clipboard t
      default-input-method "russian-computer"

      ;; scroll
      scroll-step 1
      mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil))
      mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(0.001)

      frame-resize-pixelwise t
      )

(set-language-environment "UTF-8")

(global-hl-line-mode t)
(global-hi-lock-mode t)
(menu-bar-mode t)

;; jump-char
(global-set-key (kbd "C-c M-m") 'jump-char-forward)
(global-set-key (kbd "M-m") 'ace-jump-word-mode)

;; smart C-a
(defun smart-line-beginning ()
  "Move point to the beginning of text on the current line; if that is already
the current position of point, then move it to the beginning of the line."
  (interactive)

  (let ((pt (point)))
    (beginning-of-line-text)
    (when (eq pt (point))
      (beginning-of-line))))
(add-hook 'prog-mode-hook
          (lambda () (local-set-key (kbd "C-a") 'smart-line-beginning)))


;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; хоткеи
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "C-c C-g") 'goto-line)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c w") 'kill-this-buffer)

(defun copy-line (&optional arg)
  "Kill line from current point to the end of line"
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

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;; tab width
(setq-default tab-width 4)
