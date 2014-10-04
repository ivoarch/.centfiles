;; dired ;;
(require 'dired)

;; refresh buffers
(setq-default dired-auto-revert-buffer t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; listing options
(setq ired-listing-switches "-alhv --group-directories-first")

;; Move files between split panes
(setq dired-dwim-target t)

;; Delete or copy a whole directory
;;(setq dired-recursive-copies 'always) ; Always means no asking
;;(setq dired-recursive-deletes 'top) ; Top means ask once for top dir only

;; No confirmation on file delete - clever hack
;;(setq dired-deletion-confirmer '(lambda (x) t))

(require 'dired-details)
(setq-default dired-details-hidden-string "..> ")
(define-key dired-mode-map (kbd "TAB") 'dired-details-toggle)

;; enable some really cool extensions like C-x C-j(dired-jump)
(require 'dired-x)

;; hide uninteresting files, such as backup files and AutoSave files
(setq-default dired-omit-mode t
	      dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.")

(provide 'setup-dired)
