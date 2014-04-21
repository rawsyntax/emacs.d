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
                  'pivotal-tracker

                  'exec-path-from-shell
                  'dash-at-point

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

                  'flx
                  'flx-ido
                  'projectile

                  'browse-kill-ring

                  'zenburn-theme

                  'starter-kit
                  'inf-ruby
                  'flymake-ruby)
