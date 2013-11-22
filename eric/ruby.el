(remove-hook 'ruby-mode-hook 'esk-run-coding-hook)

;; fix for https://github.com/nonsequitur/inf-ruby/commit/86db14c
(remove-hook 'ruby-mode-hook 'inf-ruby-keys)
(add-hook 'ruby-mode-hook 'inf-ruby-setup-keybindings)

(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Cheffile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Procfile" . ruby-mode))
