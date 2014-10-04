;; deft ;;

(when (require 'deft nil 'noerror)
  (setq
     deft-use-filename-as-title t
     deft-extension "org"
     deft-directory "~/Dropbox/Enotes/"
     deft-text-mode 'org-mode))

(global-set-key [f8] 'deft)

(provide 'setup-deft)
