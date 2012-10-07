# Emacs configuration for Mac Os & Emacs24

## Installation
    git clone git://github.com/zubchick/my-emacs-conf.git zubchick-emacs
    mv ~/.emacs.d ~/.emacs.d.old
    mv zubchick-emacs ~/.emacs.d
    mv ~/.emacs.d/zubchick ~/.emacs.d/$(whoami)
    mv ~/.emacs.d/zubchick.el ~/.emacs.d/$(whoami).el


## sources
* `username` dir contains files with customization. You may delete
any of this files if you don't need them.
* `init.el` contains list of used packages in var `my-packages`

## Custom shortcuts
Mac cmd key is a emacs Meta key

### in project
* `M-p` - fuzzy find file
* `M-F` - project grep

### global
* `M-z` - undo
* `M-m` - jump to char
* `C-c C-c` in jump-mode for ace-jump-mode
* `C-a` - smart version of default `C-a`
* `C-c C-g` - go to line
* `C-x C-b` - ibuffer
* `C-c w` - close current buffer
* `C-c k` - kill from cursor to the end of line
* `C-=` - expand region
* `M-M-?` - save point
* `M-M-/` - save point and go to previous saved point
* `C-t` - go to symbol (ido style)
* `C-c M-b` - run [deploy.sh](https://github.com/mix86/deploy) (should be in your
  system PATH)
* `C-.` - Mark next like this for multi cursors
* `C-.` - Mark previous
* `C-c C-<` - Mark all
