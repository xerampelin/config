(global-linum-mode 1)

(setq c-default-style "linux"
        c-basic-offset 4)

(load "~/.emacs.d/my-loadpackages.el")
(load "~/.emacs.d/my-methods.el")
(add-hook 'after-init-hook '(lambda ()
    (load "~/.emacs.d/my-noexternals.el")
))


