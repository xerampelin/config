(global-linum-mode 1)

(add-to-list 'load-path "~/.emacs.d/elpa/evil-20141014.1")
(require 'evil)
(evil-mode 1)

(setq c-default-style "linux"
        c-basic-offset 4)

(load "~/.emacs.d/my-loadpackages.el")
(load "~/.emacs.d/my-methods.el")
(add-hook 'after-init-hook '(lambda ()
    (load "~/.emacs.d/my-noexternals.el")
))


; keybindings use 'kbd' command which evaluates a keychord
; formatted in typical emacs key-chord fashion and outputs
; something global-set-key can understand.
; Example: (global-set-key (kbd "C-c C-j") 'foo)
