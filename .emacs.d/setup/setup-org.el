;; Setup org-mode ;;

;;; Enable org-mode for .org, .org_archive and .txt files by default.
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

;;; Set global keys for the most important org commands.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;; fontify org mode code blocks
(setq org-src-fontify-natively t)

;;; org tasks states
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))

;; org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (C .t)
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (emacs-lisp . t)
   (lisp .t)
   (scheme . t)
   (haskell . t)
   (perl . t)
   (js . t)
   ))

;; org publish
(require 'htmlize)
(setq org-html-htmlize-output-type 'inline-css)
(setq org-html-validation-link nil)

(setq org-export-default-language "bg"
      org-export-html-extension "html"
)

(setq org-publish-project-alist
      '(("blog"
         :components ("blog-content" "blog-static"))
        ("blog-content"
         ;; Directory for source files in org format
         :base-directory "~/Dropbox/blog/org/"
         :base-extension "org"
         ;; Path to exported HTML files
         :publishing-directory "~/Dropbox/blog/public_html/"
         ;;:publishing-function org-publish-org-to-html
         :publishing-function org-html-publish-to-html
         :recursive t
         :htmlized-source t
         :headline-levels 4
;;         :html-head "<link rel='stylesheet' href='css/blog.css' />"
         :auto-preamble t
         :auto-sitemap t
         :sitemap-title "Sitemap"
         :sitemap-filename "sitemap.org"
         :sitemap-sort-files anti-chronologically
         ;;:sitemap-file-entry-format "%t (%d)"
         )
        ;; Path to Static files
        ("blog-static"
         :base-directory "~/Dropbox/blog/files/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Dropbox/blog/public_html/files/"
         :recursive t
         :publishing-function org-publish-attachment
         )))

(provide 'setup-org)
