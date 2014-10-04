;; ZSH SHELL ;;

;; .zsh file is shell script too
(setq shell-file-name "/bin/zsh")
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))
;;(add-to-list 'auto-mode-alist '("\\.*rc$" . conf-unix-mode))

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

(provide 'setup-zsh)
