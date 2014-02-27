(setq multi-term-program "/bin/zsh")

(add-hook 'term-mode-hook
          (lambda ()
            (compilation-shell-minor-mode 1)
            (setq yas-dont-activate t)
            (setq show-trailing-whitespace nil)
            (autopair-mode -1)
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (setq term-buffer-maximum-size 6000)
            (define-key term-raw-map (kbd "C-y") 'term-paste)))
