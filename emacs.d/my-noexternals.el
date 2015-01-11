(global-linum-mode 1)

; keybindings use 'kbd' command which evaluates a keychord
; formatted in typical emacs key-chord fashion and outputs
; something global-set-key can understand.
; Example: (global-set-key (kbd "C-c C-j") 'foo)

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
(global-set-key (kbd "<f12>") (lambda() (interactive)(find-file "~/notes/Planning/gtd.org")))
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)" "DELEGATED(l@)" "CANCELED(c@)")))

;; Dired Configuration
(setq dired-listing-switches "-gohl --group-directories-first")

;; Store backup files in ~/.saves
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
