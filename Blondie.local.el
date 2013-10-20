;; mac modifications
(setq mac-command-modifier 'meta)

;; use OS X's Spotlight for M-x locate
(setq locate-make-command-line (lambda (s) `("mdfind" "-name" ,s)))

;; magit can't find git when Emacs.app is launched by launchd
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)
;; boxen stores emacs binaries elsewhere
(push "/opt/boxen/homebrew/Cellar/emacs/24.3/bin/" exec-path)
(exec-path-from-shell-initialize)

(add-to-list 'ido-ignore-files "\\`\\.DS_Store")
