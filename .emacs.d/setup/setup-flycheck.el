;; Flycheck mode
(add-hook 'php-mode-hook 'flycheck-mode)
(add-hook 'sh-mode-hook 'flycheck-mode)
(add-hook 'json-mode-hook 'flycheck-mode)
(add-hook 'nxml-mode-hook 'flycheck-mode)
(add-hook 'emacs-lisp 'flycheck-mode)
(add-hook 'ruby-mode-hook 'flycheck-mode)
(add-hook 'sass 'flycheck-mode)
(add-hook 'scss 'flycheck-mode)

(provide 'setup-flycheck)
