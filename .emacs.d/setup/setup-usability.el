;; slick-copy: make copy-past a bit more intelligent
;; from: http://www.emacswiki.org/emacs/SlickCopy
(defadvice kill-ring-save (before slick-copy activate compile)
    "When called interactively with no active region, copy a single
line instead."
    (interactive
     (if mark-active (list (region-beginning) (region-end))
       (message "Copied line")
       (list (line-beginning-position)
             (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
    "When called interactively with no active region, kill a single
line instead."
    (interactive
     (if mark-active (list (region-beginning) (region-end))
       (list (line-beginning-position)
             (line-beginning-position 2)))))

;; enable slime with slime helper
;;(condition-case ex ; if slime-helper is not installed do not give an error
;; (progn
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))

      ;; Replace "sbcl" with the path to your implementation
;; (setq inferior-lisp-program "sbcl")

      ;; connect slime automatically
      ;; when slime-mode is opened
;; (defun cliki:start-slime ()
;; (unless (slime-connected-p)
;; (save-excursion (slime))))
      ;; add full linking set
;; (add-hook 'slime-mode-hook 'cliki:start-slime))
;; ('error (message "slime could not be loaded")))

;; Search in Google
(defun google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
                           (buffer-substring (region-beginning) (region-end))
                         (read-string "Google: "))))))

;; Search in Youtube
;; http://emacsredux.com/blog/2013/08/26/search-youtube/
(defun youtube ()
  "Search YouTube with a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.youtube.com/results?search_query="
    (url-hexify-string (if mark-active
                           (buffer-substring (region-beginning) (region-end))
                         (read-string "Search YouTube: "))))))

(defun kill-emacs-or-frame (arg)
  (interactive "P")
  (if (not server-buffer-clients)
      (if (and (not arg) (> (length (visible-frame-list)) 1))
          (delete-frame)
        (save-buffers-kill-emacs))
    (save-buffer)
    (server-buffer-done (current-buffer))))

(global-set-key "\C-x\C-c" 'kill-emacs-or-frame)

;; rename buffer and file opened in emacs
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
                    (set-buffer-modified-p nil))))))

;; from @purcell
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

;; http://emacsredux.com/blog/2013/04/02/move-current-line-up-or-down/
;; also check https://github.com/rejeep/drag-stuff.el
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(defun insert-date ()
  "Insert the current date."
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%T%z")))

;; from @magnars
;; https://gist.github.com/magnars/3292872
(defun goto-line-with-feedback (&optional line)
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive "P")
  (if line
      (goto-line line)
    (unwind-protect
        (progn
          (linum-mode 1)
          (goto-line (read-number "Goto line: ")))
      (linum-mode -1))))

;; http://www.emacswiki.org/emacs/KillingBuffers
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun kill-all-dired-buffers ()
      "Kill all dired buffers."
      (interactive)
      (save-excursion
        (let ((count 0))
          (dolist (buffer (buffer-list))
            (set-buffer buffer)
            (when (equal major-mode 'dired-mode)
              (setq count (1+ count))
              (kill-buffer buffer)))
          (message "Killed %i dired buffer(s)." count))))

;; create all the intermediate dirs if they weren't existing when save a file.
;; https://stackoverflow.com/posts/6830894/revisions
(add-hook 'before-save-hook
          (lambda ()
            (let ((dir (file-name-directory buffer-file-name)))
              (unless (file-exists-p dir)
                (make-directory dir t)))))

;; a couple nice definitions taken from emacs-starter-kit
(defun sudo-edit (&optional arg)
  "Open the current buffer (or prompt for file if ARG is non-nill) using sudo to edit as root."
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo::" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo::" buffer-file-name))))

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do "
          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut "
          "aliquip ex ea commodo consequat. Duis aute irure dolor in "
          "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
          "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in "
          "culpa qui officia deserunt mollit anim id est laborum."))

;; from @snosov1
(defun lingvo-it ()
  "Translate the following region in lingvo, display a query
prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://lingvopro.abbyyonline.com/en/Translate/en-es/"
    (url-hexify-string (if mark-active
                           (buffer-substring (region-beginning) (region-end))
                         (read-string "Lingvo: "))))))

;; http://www.emacswiki.org/emacs/KillingBuffers
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; http://www.emacswiki.org/emacs/KillingBuffers
(defun kill-all-dired-buffers ()
      "Kill all dired buffers."
      (interactive)
      (save-excursion
        (let ((count 0))
          (dolist (buffer (buffer-list))
            (set-buffer buffer)
            (when (equal major-mode 'dired-mode)
              (setq count (1+ count))
              (kill-buffer buffer)))
          (message "Killed %i dired buffer(s)." count))))

;; http://emacsredux.com/blog/page/2/
(defun find-shell-init-file ()
  "Edit the shell init file in another window."
  (interactive)
  (let* ((shell (car (reverse (split-string (getenv "SHELL") "/"))))
         (shell-init-file (cond
                           ((string-equal "zsh" shell) ".zshrc")
                           ((string-equal "bash" shell) ".bashrc")
                           (t (error "Unknown shell")))))
    (find-file-other-window (expand-file-name shell-init-file (getenv "HOME")))))
(global-set-key (kbd "C-c S") 'find-shell-init-file)

;; create new scratch buffer
(defun create-scratch-buffer ()
  "Create a new scratch buffer."
  (interactive)
  (progn
    (switch-to-buffer
     (get-buffer-create (generate-new-buffer-name "*scratch*")))
    (emacs-lisp-mode)))

;; Smarter Navigation to the Beginning of a Line.
;; http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)


(provide 'setup-usability)
