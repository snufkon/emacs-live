;; (live-add-pack-lib "kibit-mode-20130403.1331")
;; (live-add-pack-lib "flycheck-20130630.2055")

;; ;; Teach compile the syntax of the kibit output
;; (require 'compile)
;; (add-to-list 'compilation-error-regexp-alist-alist
;;          '(kibit "At \\([^:]+\\):\\([[:digit:]]+\\):" 1 2 nil 0))
;; (add-to-list 'compilation-error-regexp-alist 'kibit)

;; ;; A convenient command to run "lein kibit" in the project to which
;; ;; the current emacs buffer belongs to.
;; (defun kibit ()
;;   "Run kibit on the current project.
;; Display the results in a hyperlinked *compilation* buffer."
;;   (interactive)
;;   (compile "lein kibit"))

;; (defun kibit-current-file ()
;;   "Run kibit on the current file.
;; Display the results in a hyperlinked *compilation* buffer."
;;   (interactive)
;;   (compile (concat "lein kibit " buffer-file-name)))

;; ;; (require 'kibit-mode)
;; ;; (add-hook 'clojure-mode-hook 'kibit-mode)
;; ;; (add-hook 'clojure-mode-hook 'flymake-mode-on)
;; ;; (add-hook 'clojure-mode-hook 'flycheck-mode)
