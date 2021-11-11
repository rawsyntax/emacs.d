(setq magit-set-upstream-on-push t
      magit-section-visibility-indicator nil
      magit-default-tracking-name-function 'magit-default-tracking-name-branch-only
      )

;; disable wazzup
(add-hook 'magit-mode-hook
          (lambda()
            (local-unset-key (kbd "w"))))
