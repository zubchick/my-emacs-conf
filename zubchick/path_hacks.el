(setq *PATH* (shell-command-to-string "source $HOME/.zshrc && printf $PATH"))
(if (not (getenv "TERM_PROGRAM"))
    (setenv "PATH" *PATH*))
(setq exec-path (append exec-path (split-string *PATH* ":")))
