;; a few path fixes
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name))
      elpa-path (concat dotfiles-dir "elpa/"))

(add-to-list 'load-path 'dotfiles-dir)
(add-to-list 'load-path 'elpa-path)

;; setup marmalade package repo
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
;; call so that package loads marmalade-repo
(package-initialize)

;; only run on fresh install
(unless package-archive-contents (package-refresh-contents))

(defun ensure-installed (&rest packages)
  "Checks if packages are installed, installs if not"
  (cond ((consp packages)
         (when (not (package-installed-p (car packages)))
           (package-install (car packages)))
         (apply 'ensure-installed (cdr packages)))))

 ;; packages I use
(ensure-installed 'smex
                  'magit
                  'color-theme
                  'color-theme-solarized
                  ;; then starter-kit-stuff
                  'starter-kit
                  'starter-kit-bindings
                  'starter-kit-js
                  'starter-kit-ruby
                  'starter-kit-lisp)
