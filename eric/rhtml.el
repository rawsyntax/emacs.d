(add-to-list 'auto-mode-alist '("\\.html\\.erb$" . rhtml-mode))
(add-hook 'rhtml-mode-hook '(lambda () (auto-fill-mode -1)))
