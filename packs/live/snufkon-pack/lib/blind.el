
(defvar blind-up-and-down-unit 5)

(defun blind-up ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (cond ((> alpha 0)
           (set-frame-parameter
            nil
            'alpha
            (max 0 (- alpha blind-up-and-down-unit)))))))

(defun blind-down ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (if (< alpha 100)
        (set-frame-parameter
         nil
         'alpha
         (min 100 (+ alpha blind-up-and-down-unit))))))

(provide 'blind)
