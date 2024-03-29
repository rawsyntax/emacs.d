(setq redisplay-dont-pause t
      tabbar-mode nil)

;; Turn off tabbars globally
 (when (require 'tabbar nil t)
      (tabbar-mode 0))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode 1))

;; ring the bell less
(setq ring-bell-function (lambda ()
                           (unless (memq this-command
                                         '(isearch-abort
                                           abort-recursive-edit
                                           exit-minibuffer
                                           keyboard-quit))
                             (ding)))
      inhibit-startup-message t
      color-theme-is-global t
      sentence-end-double-space nil
      shift-select-mode nil
      mouse-yank-at-point t


      ;; Prevent vertical split on larger monitors
      ;; split-height-threshold 160

      uniquify-buffer-name-style 'forward
      whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 80
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      auto-save-file-name-transforms `((".*" , (concat user-emacs-directory "temp") t))
      diff-switches "-u")

(add-hook 'before-make-frame-hook 'esk-turn-off-tool-bar)

(add-to-list 'safe-local-variable-values '(lexical-binding . t))
(add-to-list 'safe-local-variable-values '(whitespace-line-column . 80))

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; move through camelCaseWords
(global-subword-mode 1)

(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)

(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'auto-tail-revert-mode 'tail-mode)

(tool-bar-mode -1)
(menu-bar-mode -1)

(global-hl-line-mode 1)

(setq-default show-trailing-whitespace t)

;; Prefer vertically split window layout
(setq split-height-threshold nil)

;; Don't prompt about running processes on exit
(setq confirm-kill-processes nil)

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
  (load-theme 'zenburn t)
  (delete-other-windows)
  (set-cursor-color "deeppink")
  (if (window-system)
      (cond
       ((= 1050 (display-pixel-height)); 22" display
        (set-frame-size (selected-frame) 163 68)
        (set-frame-position (selected-frame) 0 -1050))
       ((= 2250 (display-pixel-height)); 24" display
        (set-frame-size (selected-frame) 163 72)
        (set-frame-position (selected-frame) 0 -1200))
       (t ; laptop runs 1440x900
        (set-frame-size (selected-frame) 163 57)
        (set-frame-position (selected-frame) 0 0))))
  (split-window-horizontally))

;; fires when an emacs frame is created (emacsclient)
;; invoke like this ( on osx):
;; emacsclient -c -n; osascript -e "tell application \"Emacs\" to activate"
(add-hook 'after-make-frame-functions 'reset-ui)

;; hook for setting up UI when not running in daemon mode
(add-hook 'emacs-startup-hook 'reset-ui)
