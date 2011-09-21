(global-set-key "\C-cm" 'magit-status)

(global-set-key (kbd "\C-cu") 'reset-ui)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'smex-update-and-run)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

(global-set-key (kbd "C-x \\") 'align-regexp)

;; stop using the arrow keys
(global-unset-key [left])
(global-unset-key [up])
(global-unset-key [right])
(global-unset-key [down])
