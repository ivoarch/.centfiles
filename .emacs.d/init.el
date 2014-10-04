;; Emacs init ;;

;; Set up load path
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d")
        (expand-file-name "~/.emacs.d/setup")
        (expand-file-name "~/.emacs.d/elisp"))
       load-path))

;; Keep emacs Custom settings in separate file
(setq custom-file "~/.emacs.d/customize.el")
(load custom-file)

;; common lisp primitives
(require 'cl)

;; install packages
(require 'setup-packages)

;; Load customizations/setups
(require 'setup-appearance)
(require 'setup-autocomplete)
(require 'setup-browser)
(require 'setup-cc-mode)
(require 'setup-clipboard)
(require 'setup-dired)
(require 'setup-deft)
(require 'setup-elfeed)
(require 'setup-files)
(require 'setup-flycheck)
(require 'setup-ido)
(require 'setup-js-mode)
(require 'setup-key-bindings)
(require 'setup-modeline)
(require 'setup-markdown)
(require 'setup-org)
(require 'setup-recentf)
(require 'setup-rpm.spec)
(require 'setup-slime)
(require 'setup-smex)
(require 'setup-server)
(require 'setup-usability)
(require 'setup-zsh)
(require 'setup-web-mode)

(provide 'init)
