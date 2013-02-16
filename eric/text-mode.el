;; soft wrap lines based on window width, like a normal prose writing editor
(remove-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; indicate soft wrapped lines vs actually hard line breaks
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
