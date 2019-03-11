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
    (define-key map (kbd "C-c ,") 'go-test-current-file)
    (define-key map (kbd "C-c .") 'go-test-current-test)
    (define-key map (kbd "C-c b") 'go-run)))

(require 'compile)
(require 'gotest)
(dolist (elt go-test-compilation-error-regexp-alist-alist)
  (add-to-list 'compilation-error-regexp-alist-alist elt))
(defun prepend-go-compilation-regexps ()
  (dolist (elt (reverse go-test-compilation-error-regexp-alist))
    (add-to-list 'compilation-error-regexp-alist elt t)))


(setq go-test-verbose t)

(add-hook 'go-mode-hook 'prepend-go-compilation-regexps)

(add-hook 'go-mode-hook 'my-go-mode-hook)
