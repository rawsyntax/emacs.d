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

                  'clojure-mode
                  'coffee-mode
                  'erlang
                  'feature-mode
                  'git-commit-mode
                  'haml-mode
                  'js2-mode
                  'less-css-mode
                  'markdown-mode
                  'puppet-mode
                  'rspec-mode
                  'sass-mode
                  'slim-mode
                  'yaml-mode

                  'flx
                  'flx-ido
                  'projectile

                  'browse-kill-ring

                  'zenburn-theme

                  'smex
                  'ido-ubiquitous
                  'find-file-in-project
                  'paredit

                  'inf-ruby
                  'flymake-ruby)


(progn
  ;; Turn off mouse interface early in startup to avoid momentary display
  (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1)))


  ;; You can keep system- or user-specific customizations here
  (setq esk-system-config (concat user-emacs-directory system-name ".el")
        esk-user-config (concat user-emacs-directory user-login-name ".el")
        esk-user-dir (concat user-emacs-directory user-login-name))

  (require 'uniquify)

  (defun esk-eval-after-init (form)
    "Add `(lambda () FORM)' to `after-init-hook'.

    If Emacs has already finished initialization, also eval FORM immediately."
    (let ((func (list 'lambda nil form)))
      (add-hook 'after-init-hook func)
      (when after-init-time
        (eval form))))

  (esk-eval-after-init
   '(progn
      (when (file-exists-p esk-system-config) (load esk-system-config))
      (when (file-exists-p esk-user-config) (load esk-user-config))
      (when (file-exists-p esk-user-dir)
        (mapc 'load (directory-files esk-user-dir t "^[^#].*el$"))))))
