;; use user's login shell for multi-term
(setq multi-term-program (shell-command-to-string "dscl /Search -read \"/Users/$USER\" UserShell | awk '{print $2}'|tr -d \"\n\"  "))

;; thanks https://github.com/redguardtoo/emacs.d/blob/master/init-term-mode.el
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(defadvice term-send-input (around my-advice-term-send-input ())
  (if (or (string-match "idg restart" (term-get-old-input-default))
          (string-match "idg start" (term-get-old-input-default)))
      (compilation-shell-minor-mode -1))
  ad-do-it
  )

(ad-activate 'term-send-input)

(add-hook 'term-mode-hook
          (lambda ()
            (compilation-shell-minor-mode 1)
            (setq yas-dont-activate t)
            (setq show-trailing-whitespace nil)
            (autopair-mode -1)
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (add-to-list 'term-bind-key-alist '("C-z" . term-send-raw))
            (setq term-buffer-maximum-size 50000)
            (define-key term-raw-map (kbd "C-y") 'term-paste)))
