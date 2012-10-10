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
;;
;; a frame is passed in when firing on after-make-frame-fuctions,
;; but not necessary when calling interactively
(defun reset-ui (&optional frame)
  (if frame
    (select-frame frame))
  (interactive)
  (smex-initialize)
  (load-theme 'solarized-dark t)
  (delete-other-windows)
  (set-cursor-color "deeppink")
  (set-face-background 'modeline-inactive "gray10")
  (if (window-system)
      (cond
       ((= 1050 (display-pixel-height)); 22" display
        (set-frame-size (selected-frame) 163 71)
        (set-frame-position (selected-frame) 0 -1050))
       ((= 1200 (display-pixel-height)); 24" display
        (set-frame-size (selected-frame) 163 76)
        (set-frame-position (selected-frame) 0 -1200))
       (t ; laptop runs 1440x900
        (set-frame-size (selected-frame) 163 53)
        (set-frame-position (selected-frame) 0 0))))
  (split-window-horizontally))

;; fires when an emacs frame is created (emacsclient)
;; invoke like this ( on osx):
;; emacsclient -c -n; osascript -e "tell application \"Emacs\" to activate"
(add-hook 'after-make-frame-functions 'reset-ui)

;; hook for setting up UI when not running in daemon mode
(add-hook 'emacs-startup-hook 'reset-ui)

;; idle-highlight annoys me, starter-kit turns it on by default
(remove-hook 'prog-mode-hook 'esk-turn-on-idle-highlight-mode)
