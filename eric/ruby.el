(remove-hook 'ruby-mode-hook 'esk-run-coding-hook)
(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))
