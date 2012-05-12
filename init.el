(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit ;; required
                      starter-kit-lisp starter-kit-bindings starter-kit-eshell ;; sk plugins
                      color-theme-solarized

                      ;; clojure
                      clojure-mode clojure-test-mode rainbow-delimiters
                      coffee-mode

                      ;; tools
                      magit smex tabbar tabbar-ruler find-things-fast wgrep
                      fill-column-indicator

                      pony-mode python-mode pymacs
                      flymake-csslint flymake-cursor
                      js2-mode  markdown-mode rainbow-mode
                      yasnippet)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-default-macosx-browser))
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(default-input-method "russian-computer")
 '(desktop-path (quote ("." "~/.emacs.d/" "~")))
 '(display-time-mode t)
 '(global-hi-lock-mode t)
 '(global-hl-line-mode t)
 '(require-final-newline t)
 '(initial-frame-alist (quote ((width . 168) (height . 47))))
 '(ispell-program-name "/usr/local/bin/aspell")
 '(menu-bar-mode t)
 '(ns-alternate-modifier (quote none))
 '(ns-command-modifier (quote meta))
 '(scroll-step 1)
 '(sgml-basic-offset 4)
 '(sgml-mode-hook (quote ((lambda nil (flymake-mode nil) (flyspell-mode nil)))))
 '(visible-bell nil)
 '(x-select-enable-clipboard t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
