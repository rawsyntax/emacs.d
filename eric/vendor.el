;; this is where I require non-elpa external dependencies
(setq eawh-elisp-external-dir
      ;; TODO: don't hardcode this
      "/Users/eric/.emacs.d/vendor")


;; add external projects to load path
(dolist (project (directory-files eawh-elisp-external-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; marmalade's version is broken for emacs 24
(require 'haml-mode)
(require 'gist)
(require 'rhtml-mode)
(require 'deft)
