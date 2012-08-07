;; ring the bell less
(setq visible-bell nil
      ring-bell-function (lambda ()
                           (unless (memq this-command
                                         '(isearch-abort
                                           abort-recursive-edit
                                           exit-minibuffer
                                           keyboard-quit))
                             (ding))))

;; prevent ffap from trying to interpret code as domain names (and
;; pinging sites that don't exist, which locks the UI until timeout)
(setq ffap-machine-p-known 'reject)

(tool-bar-mode -1)
(menu-bar-mode -1)

(global-hl-line-mode 1)
(blink-cursor-mode 1)

(setq-default show-trailing-whitespace t)

;;default display position/size based on display resolution
;;warning: assumption that the 24/22 " displays are oriented
;;         above the laptop's display
;;         Haven't found a way to check multiple monitor
;;         relative orientation via emacs yet...
(defun reset-ui ()
  (interactive)
  (smex-initialize)
  (require 'color-theme)
  (require 'color-theme-solarized)
  (delete-other-windows)
  (color-theme-solarized-dark)
  (set-cursor-color "deeppink")
  (set-face-background 'modeline-inactive "gray10")
  (cond
   ((= 1050 (display-pixel-height)); 22" display
    (set-frame-size (selected-frame) 163 71)
    (set-frame-position (selected-frame) 0 -1050))
   ((= 1200 (display-pixel-height)); 24" display
    (set-frame-size (selected-frame) 163 76)
    (set-frame-position (selected-frame) 0 -1200))
   (t ; laptop runs 1440x900
    (set-frame-size (selected-frame) 163 53)
    (set-frame-position (selected-frame) 0 0)))
  (split-window-horizontally))


(defun emacs-client-setup ()
  "Set the look and feel, different for terminal vs GUI emacsclient"
  (if (window-system)
      (spartan-gui)
    (spartan-cli)))

(if (daemonp)
    (progn
      (defun spartan-gui ()
        "Restore the look and feel that running in daemon mode cannot account
for when attached via a GUI client."
        (setq ns-command-modifier 'meta)
        ;; restore look and feel
        (reset-ui))
      (defun spartan-cli ()
        "Restore the look and feel that running in daemon mode cannot account
for when attached via a commandline client."
        (set-cursor-color "deeppink")
        )
      ))

;; fires when an emacs frame is created (emacsclient)
(add-hook 'server-visit-hook 'emacs-client-setup)

;; hook for setting up UI when not running in daemon mode
(add-hook 'emacs-startup-hook 'reset-ui)

;; idle-highlight annoys me, starter-kit turns it on by default
(remove-hook 'prog-mode-hook 'esk-turn-on-idle-highlight-mode)
