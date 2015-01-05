(require 'package)
(push '("melpa" . "http://melpa.milkbox.net/packages/")
      package-archives)
(push '("marmalade" . "http://marmalade-repo.org/packages/")
      package-archives )
(package-initialize)

(defvar required-packages
  '(magit
    yasnippet
    helm)
  "a list of packages to ensure are installed at launch")

(require 'cl)

(defun packages-installed-p ()
  (loop for p in required-packages
	when (not (package-installed-p p)) do (return nil)
	finally (return t)))

(unless (packages-installed-p)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" "done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))


