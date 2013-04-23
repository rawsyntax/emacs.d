(defun standup ()
  "Creates a buffer using containing a template for reporting status"
  (interactive)

  (if (not (eq nil (get-buffer "standup")))
      (switch-to-buffer "standup")
    (set-buffer (get-buffer-create "standup"))
    (switch-to-buffer "standup")
    (insert "#standup\ny: \nt: \nb: ")
    (previous-line)
    (previous-line)))
