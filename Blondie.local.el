;; mac modifications
(setq mac-command-modifier 'meta
      browse-url-browser-function 'browse-default-macosx-browser
      locate-make-command-line (lambda (s) `("mdfind" "-name" ,s))
      projectile-indexing-method 'alien)

(exec-path-from-shell-initialize)

(add-to-list 'ido-ignore-files "\\`\\.DS_Store")
