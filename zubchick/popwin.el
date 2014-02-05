(require 'popwin)
(global-set-key (kbd "C-z") popwin:keymap)

(setq display-buffer-function 'popwin:display-buffer)

(push '("*Ack-and-a-half*" :height 25) popwin:special-display-config)
(push '("*magit-process*" :tail t)
      popwin:special-display-config)
(push '("*Shell Command Output*" :tail t :noselect t)
      popwin:special-display-config)
(push '(compilation-mode :tail t :noselect t) popwin:special-display-config)
