;; soft wrap lines based on window width, like a normal prose writing editor
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(eval-after-load "ispell"
  '(when (executable-find ispell-program-name)
   (add-hook 'text-mode-hook 'turn-on-flyspell)))


;; indicate soft wrapped lines vs actually hard line breaks
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
