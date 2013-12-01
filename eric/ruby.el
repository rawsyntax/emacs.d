;; force loading of ruby-mode to fix hooks (avoid eval-after-load problem)
(require 'ruby-mode)

(remove-hook 'ruby-mode-hook 'esk-run-coding-hook)
(remove-hook 'ruby-mode-hook 'inf-ruby-keys)

(add-to-list 'auto-mode-alist '("Berksfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Cheffile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Procfile" . ruby-mode))
