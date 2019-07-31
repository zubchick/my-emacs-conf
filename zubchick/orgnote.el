(setq org-directory (concat (getenv "HOME") "/disk/org"))
(setq org-default-notes-file (concat org-directory "/notes.org"))
(global-set-key (kbd  "C-c r") 'org-capture)
