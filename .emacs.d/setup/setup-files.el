;;; Use y/n instead of yes/no in confirmation dialogs.
(fset 'yes-or-no-p 'y-or-n-p)

;; Set Encoding
(set-language-environment 'UTF-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8-unix)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; Enable global-auto-revert-mode
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)
(setq global-auto-revert-non-file-buffers t)

;; remove ^M symbols
(add-hook 'comint-output-filter-functions
          'comint-strip-ctrl-m)

;; store all backup and autosave files in the tmp dir
;; http://emacsredux.com/blog/2013/05/09/keep-backup-and-auto-save-files-out-of-the-way/
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Automatically make scripts starting with #! executable.
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; Lines
(setq require-final-newline t
      kill-whole-line t
      indicate-empty-lines t)

;; every buffer would be cleaned up before it’s saved
(add-hook 'before-save-hook 'whitespace-cleanup)

;; whitespaces
(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face tabs empty trailing lines-tail))

;; Always use spaces for indentation
(setq indent-tabs-mode nil)

;; Default to 2-space tabs
(setq-default tab-width 2)

(provide 'setup-files)
