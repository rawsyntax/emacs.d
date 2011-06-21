;; a few path fixes
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;; setup marmalade package repo
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
;; call so that package loads marmalade-repo
(package-initialize)

;; only run on fresh install
(unless
    (file-exists-p (concat dotfiles-dir "elpa/"))
  (package-refresh-contents))

(defun ensure-installed (&rest packages)
  "Checks if packages are installed, installs if not"
  (cond ((consp packages)
         (unless (package-installed-p (car packages))
           (package-install (car packages)))
         (apply 'ensure-installed (cdr packages)))))

 ;; packages I use
(ensure-installed 'starter-kit ;; includes magit goodness
                  'starter-kit-bindings
                  'starter-kit-js
                  'starter-kit-ruby
                  'starter-kit-lisp
                  'smex)

;; FIXME: for whatever reason, magit does not properly autoload
;;        figure out what is wrong, and stop reinstalling every time
(package-install 'magit)
