;; mac modifications
(setq mac-command-modifier 'meta)

;; magit can't find git when Emacs.app is launched by launchd
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)

(add-to-list 'ido-ignore-files "\\`\\.DS_Store")
