(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit ;; required
                      starter-kit-lisp starter-kit-bindings ;; sk plugins
                      zenburn-theme

                      ;; clojure
                      clojure-mode clojure-test-mode

                      ;; tools
                      magit smex projectile wgrep
                      popwin w3m rainbow-delimiters
                      multiple-cursors expand-region

                      ;; jumping
                      jump-char ace-jump-mode

                      python pymacs flymake-python-pyflakes
                      flymake-csslint flymake-cursor
                      js2-mode  markdown-mode rainbow-mode
                      yaml-mode
                      yasnippet
                      rect-mark
                      auctex)

  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("78b1c94c1298bbe80ae7f49286e720be25665dca4b89aea16c60dacccfbb0bca" default))))
