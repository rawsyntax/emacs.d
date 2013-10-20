(setq multi-term-program "/bin/zsh")

(add-hook 'term-mode-hook (lambda ()
                            (setq show-trailing-whitespace nil)
                            (autopair-mode -1)))
(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)
