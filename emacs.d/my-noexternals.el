(global-linum-mode 1)

;; Remove scrollbars, menu bars, and tolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;; Configure org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key (kbd "<f12>") (lambda() (interactive)(find-file "~/Dropbox/bren/notes/gtd.org")))

(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "WAITING" "DELEGATED" | "DONE" "CANCELLED" )))
