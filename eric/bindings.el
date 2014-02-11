(global-set-key "\C-cm" 'magit-status)

(global-set-key (kbd "\C-cu") 'reset-ui)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'smex-update)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

(global-set-key (kbd "C-x \\") 'align-regexp)

(global-set-key (kbd "C-8") '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-9") '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))

(global-set-key "\C-cd" 'dash-at-point)

;; stop using the arrow keys
(global-unset-key [left])
(global-unset-key [up])
(global-unset-key [right])
(global-unset-key [down])

;; emacs running as server always, so disable quit
(global-unset-key (kbd "C-x C-c"))
;; minimize is just annoying
(global-unset-key (kbd "C-x C-z"))
(global-unset-key (kbd "C-z"))

(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-%") 'query-replace)

;; ag bindings
(global-set-key (kbd "C-c a") 'ag-and-a-half)

(global-set-key (kbd "C-c t") 'toggle-shell-visor)

;; Why can't open-line just indent according to mode?
(global-set-key (kbd "C-o") 'vi-open-next-line)

;; More precise character zapping
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "C-M-z") 'zap-to-char)

(global-set-key (kbd "M-y") 'browse-kill-ring)
(global-set-key (kbd "C-c S") 'find-shell-init-file)
(global-set-key (kbd "C-c I") 'find-user-init-file)
