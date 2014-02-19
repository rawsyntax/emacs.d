(require 'projectile)

(add-hook 'ruby-mode-hook 'projectile-on)
(add-hook 'emacs-lisp-mode-hook 'projectile-on)
(add-hook 'term-mode-hook 'projectile-on)
(add-hook 'js2-mode-hook 'projectile-on)
(add-hook 'magit-mode-hook 'projectile-on)
(add-hook 'sh-mode-hook 'projectile-on)

(setq projectile-switch-project-action 'projectile-vc)
(setq projectile-enable-caching nil)
