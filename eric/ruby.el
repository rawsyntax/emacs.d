(remove-hook 'ruby-mode-hook 'esk-run-coding-hook)
;; https://github.com/technomancy/emacs-starter-kit/pull/145
(defalias 'inf-ruby-keys 'inf-ruby-setup-keybindings)
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Cheffile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Procfile" . ruby-mode))
