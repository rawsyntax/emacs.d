;; override format args to work on macOS
(defun x509-viewcert (&optional args)
  "Parse current buffer as a certificate file.
ARGS are arguments to the openssl command.  Display result in
another buffer.

With \\[universal-argument] prefix, you can edit the command arguements."
  (interactive (x509--read-arguments
                "x509 args: "
                (format "x509 -text -noout -inform %s"
                        (x509--buffer-encoding))
                'x509--viewcert-history))
  (x509--process-buffer (split-string-and-unquote args))
  (x509-mode))
