;; use user's login shell for multi-term
(setq multi-term-program (shell-command-to-string "dscl /Search -read \"/Users/$USER\" UserShell | awk '{print $2}'|tr -d \"\n\"  "))

(add-hook 'term-mode-hook
          (lambda ()
            (compilation-shell-minor-mode 1)
            (show-paren-mode -1)
            (tooltip-mode -1)
            (setq yas-dont-activate t)
            (setq show-trailing-whitespace nil)
            (autopair-mode -1)
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (add-to-list 'term-bind-key-alist '("C-z" . term-send-raw))
            (setq term-buffer-maximum-size 50000)
            (define-key term-raw-map (kbd "C-y") 'term-paste)))
