(live-add-pack-lib "helm")
(live-add-pack-lib "helm-ls-git")
(live-add-pack-lib "color-moccur-20120811.2127")
(live-add-pack-lib "helm-c-moccur-20130216.1417")

(require 'helm-config)
(require 'helm-ls-git)
(require 'color-moccur)
(require 'moccur-edit)
(require 'helm-c-moccur)

;; (helm-mode 1)

;;; helm-c-moccur --------------------------------------------------------------
;;; 参考: https://github.com/shishi/.emacs.d/blob/master/inits/09-helm-c-moccur.el

;;; ベースとなる color-moccur の設定
;;; スペース区切りで AND 検索
(setq moccur-split-word t)

;;; ディレクトリ検索時、除外するファイル
(add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
(add-to-list 'dmoccur-exclusion-mask "^#.+#$")

;; Migemo が利用できる環境であれば、利用する
(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq moccur-use-migemo t))

;;; moccur-edit-finish-edit と同時にファイルに保存する
(defadvice moccur-edit-change-file
  (after save-after-moccur-edit-buffer activate)
  (save-buffer))


(setq helm-c-moccur-helm-idle-delay 0.1)

;;; バッファ情報をハイライト
(setq helm-c-moccur-higligt-info-line-flag t)

;; 現在選択中の候補の位置を他のwindowに表示する
(setq helm-c-moccur-enable-auto-look-flag t)

;; `helm-c-moccur-occur-by-moccur の起動時にポイントの位置の単語を初期パターンにする
(setq helm-c-moccur-enable-initial-pattern t)

(setq helm-c-source-dmoccur
      '((name . "DMoccur")
        (candidates . helm-c-moccur-dmoccur-get-candidates)
        (action . (("Goto line" . helm-c-moccur-dmoccur-goto-line)))
        (persistent-action . helm-c-moccur-dmoccur-persistent-action)
        (match . (identity))
        (requires-pattern . 3)
        (init . helm-c-moccur-initialize)
        (cleanup . helm-c-moccur-clean-up)
        (delayed)
        (volatile)))

;;; helm-git-project -----------------------------------------------------------
;;; 参考: http://d.hatena.ne.jp/syohex/20121207/1354885367
(defun helm-c-sources-git-project-for (pwd)
  (loop for elt in
        '(("Modified files" . "--modified")
          ("Untracked files" . "--others --exclude-standard")
          ("All controlled files in this project" . nil))
        for title  = (format "%s (%s)" (car elt) pwd)
        for option = (cdr elt)
        for cmd    = (format "git ls-files %s" (or option ""))
        collect
        `((name . ,title)
          (init . (lambda ()
                    (unless (and (not ,option) (helm-candidate-buffer))
                      (with-current-buffer (helm-candidate-buffer 'global)
                        (call-process-shell-command ,cmd nil t nil)))))
          (candidates-in-buffer)
          (type . file))))

(defun helm-git-project-topdir ()
  (file-name-as-directory
   (replace-regexp-in-string
    "\n" ""
    (shell-command-to-string "git rev-parse --show-toplevel"))))

(defun helm-git-project ()
  (interactive)
  (let ((topdir (helm-git-project-topdir)))
    (unless (file-directory-p topdir)
      (error "I'm not in Git Repository!!"))
    (let* ((default-directory topdir)
           (sources (helm-c-sources-git-project-for default-directory)))
      (helm-other-buffer sources "*helm git project*"))))
