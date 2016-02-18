;; test url http://ya.ru

(setq browse-url-browser-function 'browse-url-default-browser)
(global-set-key (kbd "C-x RET") 'browse-url-at-point)
