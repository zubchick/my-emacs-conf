(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit ;; required
                      starter-kit-lisp starter-kit-bindings starter-kit-eshell ;; sk plugins
                      clojure-mode clojure-test-mode ;; clojure
                      magit smex tabbar tabbar-ruler find-things-fast ;; tools
                      pony-mode python-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (tango-shmango)))
 '(custom-safe-themes (quote ("bb2393dd429b87504b9fc974ad40ad75b96c0a92" default)))
 '(custom-theme-load-path (quote ("~/.emacs.d/zubchick" custom-theme-directory t)))
 '(default-input-method "russian-computer")
 '(display-time-mode t)
 '(menu-bar-mode t)
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote meta))
 '(visible-bell nil)
 '(x-select-enable-clipboard t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
