;; Autocomplete ;;

(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-show-menu 0.5)
(setq ac-quick-help-height 50)
(setq ac-quick-help-delay 1)
(setq ac-use-fuzzy t)
(setq ac-disable-faces nil)
(setq ac-quick-help-prefer-x nil)

(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(provide 'setup-autocomplete)
