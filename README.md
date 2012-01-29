# Emacs configuration for Mac Os & Emacs24

## Installation
    git clone git://github.com/zubchick/my-emacs-conf.git zubchick-emacs
    mv ~/.emacs.d ~/.emacs.d.old
    mv zubchick-emacs ~/.emacs.d
    mv ~/.emacs.d/zubchick ~/.emacs.d/$(whoami)
    mv ~/.emacs.d/zubchick.el ~/.emacs.d/$(whoami).el

## Custom shortcuts
Mac cmd key is a emacs Meta key

### in git repo
* M-p - fuzzy find file
* M-F - git-grep

### global
* M-z - undo
* C-c C-g - go to line
* C-x C-b - ibuffer
* M-M-SPC (esc + M-space) - collapse all apses to one
* C-c w - close current buffer
* C-c k - copy to kill ring from cursor to the end of line
* M-M-? - save point
* M-M-/ - save point and go to previous saved point
* C-. - switch buffer forward
* C-, - switch buffer backward
* C-t - go to symbol (ido style)
* C-c M-b - run [deploy.sh](https://github.com/mix86/deploy) (should be in your
  system PATH)

### coffee script
* C-c C-b - compile buffer
* C-c C-f - compile file
* C-c C-r - compile region
