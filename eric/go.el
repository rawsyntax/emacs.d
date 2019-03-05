(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))

(add-hook 'go-mode-hook 'go-eldoc-setup)

(require 'go-projectile)

(eval-after-load 'go-mode
  '(progn
    ;; Set $PATH to $PATH:~/.emacs.d/gotools/bin
    (go-projectile-tools-add-path)))

(defun my-go-mode-hook ()
  (local-set-key (kbd "M-.") #'godef-jump)
  (add-hook 'before-save-hook 'gofmt-before-save)
  ;; extra keybindings from https://github.com/bbatsov/prelude/blob/master/modules/prelude-go.el
  (let ((map go-mode-map))
    (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
    (define-key map (kbd "C-c m") 'go-test-current-file)
    (define-key map (kbd "C-c .") 'go-test-current-test)
    (define-key map (kbd "C-c b") 'go-run)))

(add-hook 'go-mode-hook 'my-go-mode-hook)
