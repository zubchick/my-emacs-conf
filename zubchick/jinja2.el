(setq jinja2-user-keywords
      (list "phrase" "chooseline" "chooseitem" "maybe" "nlginclude" "card"))


(setq auto-mode-alist (cons '(".*\\.nlg$" . jinja2-mode) auto-mode-alist))

(add-hook 'jinja2-mode-hook (lambda () (flyspell-mode 0)))
