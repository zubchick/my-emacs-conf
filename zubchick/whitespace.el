(require 'whitespace)
(set-face-attribute 'whitespace-indentation nil
                    :background "LightPink3" :foreground "LightPink3")
(set-face-attribute 'whitespace-space-after-tab nil
                    :background "LightPink3" :foreground "LightPink3")
(set-face-attribute 'whitespace-space-before-tab nil
                    :background "LightPink3" :foreground "LightPink3")
(set-face-attribute 'whitespace-trailing nil :background "LightPink3")
(setq whitespace-style
      '(face tabs spaces trailing lines-tail space-before-tab newline indentation
        empty space-after-tab tab-mark))

(add-hook 'prog-mode-hook 'whitespace-mode)
