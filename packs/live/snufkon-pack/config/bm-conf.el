(live-add-pack-lib "bm-20121212.2224")

(require 'bm)

;;; 参考https://github.com/shibayu36/emacs/blob/master/emacs.d/inits/40-bm.el

;; ;; マークのセーブ
;; (setq-default bm-buffer-persistence t)
;; セーブファイル名の設定
(setq bm-repository-file "~/.emacs.d/.bm-repository")

;; 起動時に設定のロード
(setq bm-restore-repository-on-load t)
(add-hook 'after-init-hook 'bm-repository-load)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'after-revert-hook 'bm-buffer-restore)

;; 設定ファイルのセーブ
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'auto-save-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
;; Saving the repository to file when on exit
;; kill-buffer-hook is not called when emacs is killed, so we
;; must save all bookmarks first
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))

;;; ブックマーク時の色を設定
(set-face-background 'bm-face "SteelBlue")
