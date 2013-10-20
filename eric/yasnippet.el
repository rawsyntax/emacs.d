(yas-global-mode 0)
(yas-reload-all)
(add-hook 'prog-mode-hook
          '(lambda ()
             (yas-minor-mode)))
