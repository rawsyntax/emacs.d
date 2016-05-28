(require 'compile)
;; Find root directory by searching for Gemfile
(defun* get-closest-gemfile-root (&optional (file "Gemfile"))
  (let ((root (expand-file-name "/")))
    (loop
     for d = default-directory then (expand-file-name ".." d)
     if (file-exists-p (expand-file-name file d))
     return d
     if (equal d root)
     return nil)))

(defun rspec-compile-file ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   ) t))

(defun rspec-compile-on-line ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s -l %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   (line-number-at-pos)
                   ) t))

(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c ,s") 'rspec-compile-on-line)
            (local-set-key (kbd "C-c ,m") 'rspec-compile-file)
            ))
