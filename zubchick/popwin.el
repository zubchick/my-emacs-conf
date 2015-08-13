(require 'popwin)
(global-set-key (kbd "C-z") popwin:keymap)

(setq display-buffer-function 'popwin:display-buffer)

(push '("*Ack-and-a-half*" :height 25) popwin:special-display-config)
(push '("\\*ag search.*\\*" :height 25 :regexp t) popwin:special-display-config)

(push '("*magit-process*" :tail t)
      popwin:special-display-config)
(push '("*Shell Command Output*" :tail t :noselect t)
      popwin:special-display-config)
(push '(compilation-mode :tail t :noselect t) popwin:special-display-config)

(push '("*anaconda-doc*") popwin:special-display-config)

(push '("*Flycheck errors*" :height 25) popwin:special-display-config)
(push '("*haskell-compilation*" :tail t :noselect t) popwin:special-display-config)
