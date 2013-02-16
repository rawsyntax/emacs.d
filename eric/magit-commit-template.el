;; TODO: pull author initials from (user-full-name)
(setq author-initials "EH")
(setq use-template-directory "/Users/eric/source")

(defun set-pivotal-story-id (id)
  "sets current pivotal tracker story id"
  (interactive "spivotal-story-id:")
  (progn
    (setq pivotal-story-id id)))

;; TODO: only do this if dir is under ~/source ??
;; TODO: prompt for pivotal-story-id if not set? or perhaps use 000
(defun su/magit/commit-message-template (&rest discard)
  "Have a template for the commit message, under a specific directory"
  (if (string-prefix-p use-template-directory (magit-git-dir))
      (unless current-prefix-arg ;; ignore commit amends
        (let ((tag (format "[%s] [%s] " author-initials pivotal-story-id)))
          (goto-char (point-min))
          (unless (search-forward tag nil t)
            (insert tag))
          (goto-char (point-max))))))


(add-hook 'magit-log-edit-mode-hook 'su/magit/commit-message-template)
