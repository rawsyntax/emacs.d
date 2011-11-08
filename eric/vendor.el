;; this is where I require non-elpa external dependencies
(setq eawh-elisp-external-dir
      (expand-file-name "vendor" dotfiles-dir))


;; add external projects to load path
(dolist (project (directory-files eawh-elisp-external-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; marmalade's haml-mode does not work with emacs 24
(require 'haml-mode)
;; marmalade's inf-ruby is 2.2.1 and does not work
(require 'inf-ruby)
