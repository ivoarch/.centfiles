;; recentf ;;
(require 'recentf)
(recentf-mode 1)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(setq recentf-max-saved-items 50)

(global-set-key (kbd "C-c f") 'ido-recentf-open)

(provide 'setup-recentf)
