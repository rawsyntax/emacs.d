;; mac modifications
(setq mac-command-modifier 'meta)

;; use OS X's Spotlight for M-x locate
(setq locate-make-command-line (lambda (s) `("mdfind" "-name" ,s)))

;; magit can't find git when Emacs.app is launched by launchd
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)

(add-to-list 'ido-ignore-files "\\`\\.DS_Store")
