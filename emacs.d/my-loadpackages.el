(load "~/.emacs.d/my-packages.el")

(require 'evil)
(evil-mode 1)

(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

(require 'yasnippet)
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
(add-hook 'term-mode-hook (lambda ()
			    (setq yas-dont-activate t)))

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-M-y)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-unset-key (kbd "C-x c"))
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
;(setq helm-split-window-in-side-p t
;      helm-move-to-line-cycle-in-source t
;      helm-ff-search-library-in-sexp t
;      helm-scroll-amount 8
;      helm-ff-file-name-history-use-recentf t)

