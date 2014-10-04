(require 'ido-vertical-mode)
(require 'flx-ido)

(dolist (mode
         '(ido-mode                   ; Interactivly do.
           ido-everywhere             ; Use Ido for all buffer/file reading.
           ido-vertical-mode          ; Makes ido-mode display vertically.
           flx-ido-mode))             ; Toggle flx ido mode.
  (funcall mode 1))

(setq ido-vertical-define-keys 'C-n-C-p-up-down)

(provide 'setup-ido)
