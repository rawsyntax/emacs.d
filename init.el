;; setup marmalade package repo
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

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
                  'ack-and-a-half
                  'yasnippet
                  'multi-term

                  'exec-path-from-shell
                  'dash-at-point

                  'js2-mode
                  'coffee-mode
                  'haml-mode
                  'sass-mode
                  'yaml-mode
                  'slim-mode
                  'rspec-mode
                  'markdown-mode
                  'puppet-mode
                  'git-commit-mode
                  'feature-mode

                  'browse-kill-ring

                  'zenburn-theme

                  'starter-kit
                  'starter-kit-bindings
                  'starter-kit-ruby
                  'starter-kit-lisp)
