
;; 参考: http://karetta.jp/book-node/gauche-hacks/004640
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))

(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)

;;; gauche を再起動する
(defun reload-scheme ()
  (interactive)
  (if (get-process "scheme")
      (delete-process "*scheme*"))
  (if (get-buffer "*scheme*")
      (kill-buffer "*scheme*"))
  (run-scheme scheme-program-name))
