;; setup-browser ;;

;; Open URLs from GNU Emacs in Conkeror in a new buffer
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox"
      ido-handle-duplicate-virtual-buffers 2)

(defun my-dired-browser-find-file ()
  "Dired function to view a file in a web browser"
  (interactive)
  (browse-url (browse-url-file-url (dired-get-filename))))

;; Bind a Key in Emacs's Dired-Mode to View a File in the Default Browser
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "b" 'my-dired-browser-find-file)))

(provide 'setup-browser)
