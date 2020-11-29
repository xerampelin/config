(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;;(setq compilation-auto-jump-to-first-error t)
(setq compilation-scroll-output t)
(setq compilation-scroll-output 'first-error)
(setq dired-dwim-target t)

;; C-tab was timing out on some c++ completions. It defaults to timeout of 2 seconds, but we'll change to 8.
;;(setq company-async-timeout 8)

;; M-s h r   -- hilight regexp
;; M-s h .   -- hilight text under cursor
(global-hi-lock-mode 1)

(global-linum-mode t)

(require 'cc-mode)

(defun bc-open-notes ()
  "Open notes.org"
  (interactive)
  (dired "~/Documents/notes/"))
(defun bc-open-emacs-init ()
  "Open emacs init.el"
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(defun bc-duplicate-window ()
  "Close all other frames and duplicate the current one"
  (interactive)
  (delete-other-windows)
  (split-window-right)
  (other-window 1))

(which-key-mode)

;;(global-linum-mode t)

;; (require 'smooth-scrolling)
;; (smooth-scrolling-mode 1)
;; (setq smooth-scroll-margin 5)

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

;;(require 'recentf)
;;(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
;;(recentf-mode t)

;;(setq recentf-max-saved-items 50)
;;(defun ido-recentf-open ()
;;  "Use `ido-completing-read' to \\[find-file] a recent file"
;;  (interactive)
;;  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
;;      (message "Opening file...")
;;    (message "Aborting")))


(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(ido-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gdb-non-stop-setting nil t)
 '(git-commit-summary-max-length 100)
 '(message-fill-column 100)
 '(org-M-RET-may-split-line (quote ((default))))
 '(org-goto-auto-isearch nil)
 '(package-selected-packages (quote (org-journal which-key company bug-hunter ag)))
 '(rtags-error-message-function (quote sb-rtags-error-message-function)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(woman-unknown ((t (:inherit font-lock-warning-face :foreground "red4")))))


(define-key c-mode-base-map (kbd "C-c i") 'clang-format-region)
(global-set-key (kbd "s-h") 'windmove-left)
(global-set-key (kbd "s-l") 'windmove-right)
(global-set-key (kbd "s-k") 'windmove-up)
(global-set-key (kbd "s-j") 'windmove-down)
(global-set-key (kbd "C-x o") 'ace-window)

(require 'org-journal)
