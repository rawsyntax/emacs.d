;; mac modifications
(setq mac-command-modifier 'meta)

;; use OS X's Spotlight for M-x locate
(setq locate-make-command-line (lambda (s) `("mdfind" "-name" ,s)))

(exec-path-from-shell-initialize)

(add-to-list 'ido-ignore-files "\\`\\.DS_Store")
