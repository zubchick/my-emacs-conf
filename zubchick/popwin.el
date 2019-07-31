(require 'popwin)
(global-set-key (kbd "C-z") popwin:keymap)

(setq display-buffer-function 'popwin:display-buffer)

(push '("\\*magit-process.*" :tail t :regexp t :height 25 :noselect t)
      popwin:special-display-config)
(push '("*Shell Command Output*" :tail t :noselect t)
      popwin:special-display-config)
(push '(compilation-mode :tail t :noselect t) popwin:special-display-config)

(push '("*anaconda-doc*") popwin:special-display-config)
(push '("\\*godoc.*\\*" :regexp t) popwin:special-display-config)

(push '("*Flycheck errors*" :height 25) popwin:special-display-config)
(push '("*haskell-compilation*" :tail t :noselect t) popwin:special-display-config)
