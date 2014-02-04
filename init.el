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
(ensure-installed 'autopair
                  'smex
                  'magit
                  'yasnippet
                  'multi-term

                  'exec-path-from-shell
                  'dash-at-point
                  'dictionary

                  'js2-mode
                  'clojure-mode
                  'coffee-mode
                  'haml-mode
                  'less-css-mode
                  'sass-mode
                  'yaml-mode
                  'slim-mode
                  'rspec-mode
                  'markdown-mode
                  'puppet-mode
                  'git-commit-mode
                  'feature-mode
                  'erlang

                  'browse-kill-ring

                  'zenburn-theme

                  'starter-kit
                  'starter-kit-bindings
                  'inf-ruby
                  'starter-kit-ruby
                  'starter-kit-lisp)
