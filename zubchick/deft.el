(when (require 'deft nil 'noerror)
   (setq
      deft-extension "md"
      deft-directory "~/disk/org/deft"
      deft-text-mode 'markdown-mode)
   (global-set-key (kbd "<f8>") 'deft))
