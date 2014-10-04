;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; making buffer names unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; turned off the box around the mode-line
;;(set-face-attribute 'mode-line nil :box nil)
;;(set-face-attribute 'mode-line-inactive nil :box nil)
;;(set-face-attribute 'mode-line-highlight nil :box nil)

;; http://bzg.fr/emacs-hide-mode-line.html
(defvar-local hidden-mode-line-mode nil)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode RET to make the mode-line appear."))))

(provide 'setup-modeline)
