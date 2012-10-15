;; a few path fixes
(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name))
      elpa-path (concat dotfiles-dir "elpa/"))

(setq custom-file (concat dotfiles-dir "custom.el"))
(load custom-file)

(add-to-list 'load-path 'dotfiles-dir)
(add-to-list 'load-path 'elpa-path)

;; setup marmalade package repo
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(unless package-archive-contents (package-refresh-contents))

;; packages I use
(defvar my-packages
  '(smex
    magit
    deft
    imgur
    haml-mode sass-mode yaml-mode js2-mode
    flymake-haml flymake-ruby flymake-sass
    markdown-mode
    ack-and-a-half
    yasnippet
    solarized-theme
    starter-kit
    starter-kit-bindings starter-kit-ruby starter-kit-lisp)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
