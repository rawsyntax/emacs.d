;; setup marmalade package repo
(require 'package)
(setq package-archives
 '(("MELPA"        . "https://melpa.org/packages/")
   ("MELPA Stable" . "https://stable.melpa.org/packages/")
   ("GNU ELPA"     . "https://elpa.gnu.org/packages/")
   ("NonGNU ELPA"  . "https://elpa.nongnu.org/nongnu/"))
 package-archive-priorities
 '(("MELPA"        . 8)
   ("MELPA Stable" . 6)
   ("GNU ELPA"     . 4)
   ("NonGNU ELPA"  . 10)))

(package-initialize)

(unless package-archive-contents (package-refresh-contents))

(defvar my-packages
  '(
    compat
    ein
    amx
    smartparens
    flx flx-ido projectile
    smex magit git-timemachine yasnippet yagist
    multi-vterm ;; replacement for multi-term
    exec-path-from-shell
    dash-at-point
    expand-region
    ivy
    counsel-jq
    git-link

    browse-kill-ring
    browse-at-remote
    persistent-scratch

    zenburn-theme

    alchemist

    go-mode
    go-add-tags
    go-autocomplete
    go-dlv
    go-guru
    go-mode
    go-playground
    go-eldoc
    go-rename
    dap-mode

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

    enh-ruby-mode inf-ruby

    ido-completing-read+
    find-file-in-project
    sx
    launchctl
    dumb-jump
    flycheck ;; for go-mod-mode
    flymake
    flymake-go
    loccur
    x509-mode ;; with overriden viewcert in eric/x509-mode.el
    ;; which-key
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(mermaid-mode request ein git-link zenburn-theme yasnippet yaml-mode yagist x509-mode web-mode sx smex smartparens slim-mode scala-mode sass-mode rspec-mode rhtml-mode puppet-mode projectile persistent-scratch paredit multi-vterm magit loccur launchctl js2-mode inf-ruby ido-completing-read+ go-rename go-playground go-guru go-eldoc go-dlv go-autocomplete go-add-tags git-timemachine flymake-go flycheck flx-ido find-file-in-project feature-mode expand-region exec-path-from-shell erlang enh-ruby-mode dumb-jump dash-at-point dap-mode counsel-jq coffee-mode clojure-mode browse-kill-ring browse-at-remote amx alchemist)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
