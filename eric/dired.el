;; requires `brew install coreutils` on os x
(setq insert-directory-program (executable-find "gls"))

;; thanks http://ergoemacs.org/emacs/dired_sort.html
(defun xah-dired-sort ()
  "Sort dired dir listing in different ways.
Prompt for a choice.
URL `http://ergoemacs.org/emacs/dired_sort.html'
Version 2015-07-30"
  (interactive)
  (let ($sort-by $arg)
    (setq $sort-by (ido-completing-read "Sort by:" '( "date" "size" "name" "dir")))
    (cond
     ((equal $sort-by "name") (setq $arg "-Al --si --time-style long-iso "))
     ((equal $sort-by "date") (setq $arg "-Al --si --time-style long-iso -t"))
     ((equal $sort-by "size") (setq $arg "-Al --si --time-style long-iso -S"))
     ((equal $sort-by "dir") (setq $arg "-Al --si --time-style long-iso --group-directories-first"))
     (t (error "logic error 09535" )))
    (dired-sort-other $arg )))

(require 'dired)
(define-key dired-mode-map (kbd "s") 'xah-dired-sort)

