;; ring the bell less
(setq visible-bell nil
      ring-bell-function (lambda ()
                           (unless (memq this-command
                                         '(isearch-abort abort-recursive-edit
                                                         exit-minibuffer
                                                         keyboard-quit))
                             (ding))))
