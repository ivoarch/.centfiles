;; appereance ;;

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'blink-cursor-mode) (blink-cursor-mode -1))
(if (fboundp 'use-file-dialog) (setq use-file-dialog nil))
(if (fboundp 'use-dialog-box) (setq use-dialog-box nil))

;; Show a marker in the left fringe for lines not in the buffer
(setq indicate-empty-lines t)

;; Enable/Disable fringe-mode
(defun enable-fringe ()
  (interactive)
  (fringe-mode '(nil . nil) ))

(defun disable-fringe ()
  (interactive)
  (fringe-mode '(0 . 0) ))

;; set font for all windows
(add-to-list 'default-frame-alist
            '(font . "DejaVu Sans Mono-10"))

;; Load theme
(load-theme 'zenburn t)

;; cursor style
(setq-default cursor-type 'bar)

;; highlight the current line
(global-hl-line-mode +1)

;; Hide mouse cursor while typing.
(setq make-pointer-invisible t)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)
(setq show-paren-delay 0)

;; For buffers visiting files show the full file name in the title
;; bar; for buffers not associated with files show the buffer name.
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; Do not break lines
(set-default 'truncate-lines t)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

(provide 'setup-appearance)
