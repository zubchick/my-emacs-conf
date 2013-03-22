(require 'whitespace)
(setq whitespace-style
      '(face trailing lines-tail space-before-tab newline indentation
        empty space-after-tab tab-mark))

(add-hook 'prog-mode-hook 'whitespace-mode)
