(require 'cc-mode)

;; c++
(add-hook 'c++-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil)
             (c-set-style "cc-mode")
             (setq c-indent-level 4)
             (setq c-tab-width 4)
             (setq tab-width 4)
             (setq c-basic-offset tab-width)))
;; c
(add-hook 'c-mode-hook
          '(lambda()
             (setq indent-tabs-mode nil)
             (c-set-style "k&r") ;; What Kernighan and Ritchie, the authors of C used in their book
             (setq c-indent-level 4)
             (setq c-tab-width 4)
             (setq tab-width 4)
             (setq c-basic-indent 2)
             (setq c-basic-offset tab-width)))

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

(require 'autopair)
(autopair-global-mode 1)
;; tells autopair to automatically wrap the selection region with the delimiters you’re trying to insert.
(setq autopair-autowrap t)

(require 'auto-complete-clang)
(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)

(provide 'setup-cc-mode)
