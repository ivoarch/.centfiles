;; Guru-mode
(require 'guru-mode)
(guru-global-mode +1)

;; Jump from file to containing directory
(global-set-key (kbd "C-x C-j") 'dired-jump) (autoload 'dired-jump "dired")

;; goto line
(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key [remap goto-line] 'goto-line-with-feedback)

;; split-window
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)

;; resize window
(global-set-key (kbd "C-c <up>") 'shrink-window)
(global-set-key (kbd "C-c <down>") 'enlarge-window)
(global-set-key (kbd "C-c <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-c <right>") 'enlarge-window-horizontally)

;; buffer switching
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; move-current-line-up-or-down
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

;; iBuffer
(autoload 'ibuffer "ibuffer" "List buffers." t)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; kill buffer without questions
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; kills all buffers, except the current one
(global-set-key (kbd "C-x M-k") 'kill-other-buffers)

;; clipboard
(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-y") 'clipboard-yank)

;; Delete words with C-w and rebind kill region to C-x C-k
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Files
(global-set-key (kbd "C-x f") 'ido-find-file)
(global-set-key (kbd "C-o") 'ido-find-file)
(global-set-key (kbd "C-x s") 'save-buffer)
(global-set-key (kbd "C-x C-s") 'save-some-buffers)
(global-set-key (kbd "C-x c") 'save-buffers-kill-emacs)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Browse Url
(define-key global-map (kbd "C-x M-g") 'google)
(define-key global-map (kbd "C-x M-y") 'youtube)
(define-key global-map (kbd "C-x M-b") 'browse-url-at-point)

;; Proced
(global-set-key (kbd "C-x p") 'proced)

;; Multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Ace-window
(require 'ace-window)
(global-set-key (kbd "C-x o") 'other-window)
(global-set-key [remap other-window] 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; Ace-jump-mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(provide 'setup-key-bindings)
