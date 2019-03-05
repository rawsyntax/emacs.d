;; this is where I require non-elpa external dependencies
(setq eawh-elisp-external-dir
      (expand-file-name (concat user-emacs-directory "vendor")))

;; add external projects to load path
(dolist (project (directory-files eawh-elisp-external-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; required for sass mode to work (incompatible with package repo version)
(require 'haml-mode)
(require 'ag-and-a-half)
(require 'apib-mode)
(require 'go-projectile)
