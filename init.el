(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

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
                      popwin rainbow-delimiters
                      multiple-cursors expand-region
                      ack-and-a-half rect-mark nav
                      yasnippet

                      ;; other
                      deft

                      ;; jumping
                      jump-char ace-jump-mode

                      python pymacs cython-mode
                      flymake-python-pyflakes flymake-csslint flymake-cursor
                      js2-mode markdown-mode rainbow-mode
                      yaml-mode)

  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("f5e56ac232ff858afb08294fc3a519652ce8a165272e3c65165c42d6fe0262a0" "36a309985a0f9ed1a0c3a69625802f87dee940767c9e200b89cdebdb737e5b29" "0bac11bd6a3866c6dee5204f76908ec3bdef1e52f3c247d5ceca82860cccfa9d" "27470eddcaeb3507eca2760710cc7c43f1b53854372592a3afa008268bcf7a75" "4643bfb5904f0fe168e89f02623b5027415c254b4b1c022eca338ad7948b027d" "64b7be5703b90e05f7bc1f63a9f689a7c931626462697bea9476b397da194bd9" "5d77398bc9430a172eab9e530b43c93cf57bc81c49856dcf59dce83d731a47e6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
