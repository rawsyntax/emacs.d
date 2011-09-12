;; flymake
(require 'flymake)

(defun flymake-create-temp-intemp (file-name prefix)
  "Return file name in temporary directory for checking FILE-NAME.
       This is a replacement for `flymake-create-temp-inplace'. The
       only difference is that it gives a file name in
       `temporary-file-directory' instead of the same directory as
       FILE-NAME.

       For the use of PREFIX see that function.

       Note that not making the temporary file in another directory
       \(like here) will not work if the file you are checking depends
       on relative paths to other files \(for the type of checks flymake
       makes)."
  (unless (stringp file-name)
    (error "Invalid file-name"))
  (or prefix
      (setq prefix "flymake"))
  (let* ((prefix (concat
                  (file-name-nondirectory (file-name-sans-extension
                                           file-name))
                  "_" prefix))
         (suffix  (concat "." (file-name-extension file-name)))
         (temp-name (make-temp-file prefix nil suffix)))
    (flymake-log 3 "create-temp-intemp: file=%s temp=%s"
                 file-name temp-name)
    temp-name))

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-intemp))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)
      flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          (lambda ()
            (when (and buffer-file-name
                       (file-writable-p
                        (file-name-directory buffer-file-name))
                       (file-writable-p buffer-file-name)
                       (if (fboundp 'tramp-list-remote-buffers)
                           (not (subsetp
                                 (list (current-buffer))
                                 (tramp-list-remote-buffers)))
                         t))
              (local-set-key (kbd "C-c d")
                             'flymake-display-err-menu-for-current-line)
              (flymake-mode t))))
