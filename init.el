;; setup marmalade package repo
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents (package-refresh-contents))

(defvar my-packages
  '(autopair paredit

    flx flx-ido projectile
    smex magit git-timemachine yasnippet yagist deft multi-term
    exec-path-from-shell
    dash-at-point
    expand-region

    browse-kill-ring
    persistent-scratch
    zenburn-theme

    alchemist
    go-mode
    clojure-mode
    coffee-mode
    erlang
    feature-mode
    js2-mode
    less-css-mode
    markdown-mode
    puppet-mode
    rspec-mode
    sass-mode
    slim-mode
    yaml-mode
    rhtml-mode
    web-mode
    scala-mode
    ensime

    enh-ruby-mode inf-ruby

    ido-ubiquitous find-file-in-project
    sx
    launchctl
    helm ;; helm-top for process management
    )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

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
