
;;; 参考: http://stackoverflow.com/questions/4288339/how-do-you-comment-out-all-or-part-of-a-lisp-s-exp-using-paredit
;;; S式単位でコメントアウト
(defun comment-sexp ()
  "Comment out the sexp at point."
  (interactive)
  (save-excursion
    (mark-sexp)
    (paredit-comment-dwim)))
