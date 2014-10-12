;; setup-packages.el
;; Following code adapted from Emacs-Prelude @
;; http://batsov.com/articles/2012/02/19/package-management-in-emacs-the-good-the-bad-and-the-ugly/

(require 'package)

;; list of repositories containing packages
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))

;; activate all the packages
(package-initialize)

;; list of packages used in this configuration
(setq required-packages
      (list
       'ac-slime                  ; auto-complete plugin for Slime.
       'ace-window                ; GNU Emacs package for selecting a window to switch to
       'ace-jump-mode             ; a quick cursor jump mode for emacs
       'auto-complete             ; auto-completion extension for GNU Emacs.
       'auto-complete-clang       ; nice C & C++ autocomplete for Emacs.
       'autopair                  ; automagically pair braces and quotes.
       'deft                      ; mode for quickly browsing, filtering, and editing directories of plain text notes.
       'dired-details             ; hide/show the details of each file or directory in DiredMode.
       'elfeed                    ; An Emacs web feeds client.
;       'elscreen                  ; GNU Emacs window session manager.
       'epresent                  ; Simple presentation mode for Emacs Org-mode
       'flycheck                  ; fly syntax checking for GNU Emacs.
       'flx-ido                   ; Fuzzy matching for Emacs ... a la Sublime Text.
       'guru-mode                 ; The Emacs guru way
       'htmlize                   ; Convert buffer text and decorations to HTML.
       'ido-vertical-mode         ; makes ido-mode display vertically.
       'js2-mode                  ; javascript-mode for emacs.
       'magit                     ; Emacs mode for Git.
       'markdown-mode             ; Emacs mode for Markdown-formatted files.
       'multi-term                ; managing multiple terminal buffers in Emacs.
       'multiple-cursors          ; Multiple cursors for emacs.
;       'mwe-log-commands          ; display the keys you typed.
       'org                       ; an Emacs Mode for Notes, Planning, and Authoring.
       'org-plus-contrib          ; contrib files for org.
;       'org-toc                   ; table of contents in the org files without exporting (useful primarily for readme files on GitHub)
       'paredit                   ; minor mode for editing parentheses.
       'rainbow-mode              ; Colorize color names in buffers.
       'rainbow-delimiters        ; rainbow delimiters mode.
       'recentf                   ; is a minor mode that builds a list of recently opened files.
       'rpm-spec-mode             ; is a mode for creating RPM spec files.
       'slime                     ; Emacs mode for Common Lisp development.
       'smex                      ; M-x enhancement for Emacs. Built on top of IDO.
       'volatile-highlights       ; highlights changes to the buffer.
       'xkcd                      ; Read xkcd from emacs.
       'yasnippet                 ; Template system for Emacs.
;       'zenburn-theme             ; The Zenburn colour theme ported to Emacs.
       'web-mode                  ; web template editing mode for emacs.
       ))

;; check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(defun package-list-unaccounted-packages ()
  "Like `package-list-packages', but shows only the packages that
  are installed and are not in `required-packages'.  Useful for
  cleaning out unwanted packages."
  (interactive)
  (package-show-package-list
   (remove-if-not (lambda (x) (and (not (memq x required-packages))
                                   (not (package-built-in-p x))
                                   (package-installed-p x)))
                  (mapcar 'car package-archive-contents))))

(provide 'setup-packages)
;;; setup-packages.el ends here
