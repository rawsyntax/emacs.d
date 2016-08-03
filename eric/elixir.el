(setq require-final-newline t)
(setq alchemist-hooks-test-on-save nil)
(add-hook 'elixir-mode-hook 'alchemist-mode)

(defun custom-erlang-mode-hook ()
  (define-key erlang-mode-map (kbd "M-,") 'alchemist-goto-jump-back))

(add-hook 'erlang-mode-hook 'custom-erlang-mode-hook)
