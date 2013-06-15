
(live-add-pack-lib "all-1.0")
(live-add-pack-lib "all-ext-20130201.1223")

(require 'all-ext)

;;; *All*バッファにいるときにC-c C-qで編集を終了
(require 'view)
(defun all-mode-quit ()
  (interactive)
  (view-mode 1) (View-quit))
(define-key all-mode-map (kbd "C-c C-q") 'all-mode-quit)


;;; helm-c-moccur から all-mode に移動できるように設定
(eval-after-load "helm-c-moccur"
  '(progn
     (defun all-from-helm-moccur ()
       "Call `all' from `helm' content."
       (interactive)
       (helm-run-after-quit
        'all-from-anything-occur-internal "helm-moccur"
        helm-c-moccur-buffer helm-current-buffer))
     (define-key helm-c-moccur-helm-map (kbd "C-c C-a")
       'all-from-helm-moccur)))
