(setq vterm-toggle-fullscreen-p t)

(add-hook 'vterm-mode-hook
          (lambda ()
            (setq yas-dont-activate t)
            (setq show-trailing-whitespace nil)
            (setq term-eol-on-send nil)
            (autopair-mode -1)
            (setq vterm-buffer-maximum-size 10000)))
