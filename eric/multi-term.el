(setq multi-term-program "/bin/zsh")

(add-hook 'term-mode-hook (lambda ()
                            (setq show-trailing-whitespace nil)
                            (autopair-mode -1)))

(add-hook 'term-mode-hook
  (lambda ()
    (add-to-list 'term-bind-key-alist '("M-[" . multi-term-next))
    (add-to-list 'term-bind-key-alist '("M-]" . multi-term-prev))
    (add-to-list 'term-bind-key-alist '("C-c C-M-t" .  multi-term))))
