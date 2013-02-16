;; TODO: pull author initials from (user-full-name)
(setq author-initials "EH")
(setq use-template-directory "~/source")

(defun set-pivotal-story-id (id)
  "sets current pivotal tracker story id"
  (interactive "spivotal-story-id:")
  (progn
    (setq pivotal-story-id id)))

(defun su/magit/commit-message-template (&rest discard)
  "Have a template for the commit message, under a specific directory"
  ;; use 000 unless already set
  (unless (boundp 'pivotal-story-id)
    (setq pivotal-story-id "000"))
  ;; restrict template to use-template-directory (and below)
  (if (string-prefix-p (expand-file-name use-template-directory)
                       (magit-git-dir))
      (unless current-prefix-arg ;; ignore commit amends
        (let ((tag (format "[%s] [%s] " author-initials pivotal-story-id)))
          (goto-char (point-min))
          (unless (search-forward tag nil t)
            (insert tag))
          (goto-char (point-max))))))

(add-hook 'magit-log-edit-mode-hook 'su/magit/commit-message-template)
(expand-file-name use-template-directory)
