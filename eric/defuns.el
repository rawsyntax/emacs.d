(defun delete-file-and-buffer ()
  "Deletes the current file and buffer, assumes file exists"
  (interactive)
  (delete-file buffer-file-name)
  (kill-buffer (buffer-name)))

(defun refresh-buffer ()
  "Refresh the current buffer from disk"
  (interactive)
  (revert-buffer t t))

;; TODO: make rename uniquify buffer if a buffer with same name
;;       already exists
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(defun swap-windows ()
 "If you have 2 windows, it swaps them."
 (interactive)
 (cond ((not (= (count-windows) 2))
        (message "You need exactly 2 windows to do this."))
       (t
        (let* ((w1 (first (window-list)))
               (w2 (second (window-list)))
               (b1 (window-buffer w1))
               (b2 (window-buffer w2))
               (s1 (window-start w1))
               (s2 (window-start w2)))
          (set-window-buffer w1 b2)
          (set-window-buffer w2 b1)
          (set-window-start w1 s2)
          (set-window-start w2 s1)))))


;; thanks!! emacs-fu.blogspot.com
(defun djcb-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
          (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

(defun scratch-js ()
  "Create or switch to a javascript mode scratch buffer"
  (interactive)

  (if (not (eq nil (get-buffer "scratch-js")))
      (switch-to-buffer "scratch-js")
    (set-buffer (get-buffer-create "scratch-js"))
    (js2-mode)
    (switch-to-buffer "scratch-js")))

(defun remove-console-log-js ()
  "Delete console.log() debugging lines"
  (interactive)
  (save-excursion
    (replace-regexp "^.*console\.log.+\w*\n" "")))
