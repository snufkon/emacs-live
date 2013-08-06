;; User pack init file
;;
;; User this file to initiate the pack configuration.
;; See README for more information.

;; Load config
(live-load-config-file "package-conf.el")
(live-load-config-file "font-conf.el")
(live-load-config-file "key-chord-conf.el")
(live-load-config-file "helm-conf.el")
(live-load-config-file "gauche-conf.el")
(live-load-config-file "blind-conf.el")
(live-load-config-file "auto-complete-conf.el")
(live-load-config-file "paredit-conf.el")
(live-load-config-file "clojure-conf.el")
(live-load-config-file "nrepl-conf.el")
(live-load-config-file "yasnippet-conf.el")
(live-load-config-file "popwin-conf.el")
(live-load-config-file "all-conf.el")
(live-load-config-file "bm-conf.el")
(live-load-config-file "wgrep-conf.el")
(live-load-config-file "elscreen-conf.el")
(live-load-config-file "recentf-conf.el")
(live-load-config-file "org-mode-conf.el")
(live-load-config-file "misc.el")
(live-load-config-file "bindings.el")

;;; Emacs 24.3 にバージョンアップで発生した不具合対応
;; last-command-char が古いのでなくなった
;; 参考: http://plaza.rakuten.co.jp/tmaechan/diary/201304010000/
(define-obsolete-variable-alias 'last-command-char 'last-command-event)
