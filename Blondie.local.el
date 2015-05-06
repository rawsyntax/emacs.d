;; mac modifications
(setq mac-command-modifier 'meta
      browse-url-browser-function 'browse-default-macosx-browser
      locate-make-command-line (lambda (s) `("mdfind" "-name" ,s))
      projectile-indexing-method 'alien
      browse-url-browser-function 'browse-url-default-macosx-browser)

(exec-path-from-shell-initialize)
