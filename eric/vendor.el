;; this is where I require non-elpa external dependencies
(add-to-list 'load-path (concat dotfiles-dir "vendor/thorstadt-haml-mode"))
(require 'haml-mode)

;; marmalade's inf-ruby is 2.2.1 and does not work
(add-to-list 'load-path (concat dotfiles-dir "vendor/inf-ruby"))
(require 'inf-ruby)
