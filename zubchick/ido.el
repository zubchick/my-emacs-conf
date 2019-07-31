(require 'ido-completing-read+)

(setq ido-enable-flex-matching t
      ido-create-new-buffer 'always)
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(flx-ido-mode 1)
