(desktop-save-mode t)
(setq history-length 250
      desktop-path '("~/.emacs.d/"))
(add-to-list 'desktop-globals-to-save 'file-name-history)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
