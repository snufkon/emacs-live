(setq org-directory "~/Dropbox/Emacs/org-file/gtd")

;;; TODO 状態をカスタマイズ
(setq org-todo-keywords
       '((sequence "TODO(t)" "WAIT(w)" "SOMEDAY(s)" "|" "DONE(d)")))

;;;; Emacs テクニックバイブル 14.2 ---------------------------------------------
; (require 'org)
;; うまく動いていない
(defun org-insert-upheading (org)
  "1レベル上の見出しを入力する。"
  (interactive "P")
  (org-insert-heading arg)
  (cond ((org-on-heading-p) (org-do-promote))
	((org-at-item-p) (org-indent-item -1))))
(defun org-insert-heading-dwim (arg)
  "現在と同じレベルの見出しを入力する。
C-uをつけると１レベル上、C-u C-uをつけると１レベル下の見出しを入力する。"
  (interactive "p")
  (case arg
    (4  (org-insert-subheading nil))	;C-u
    (16 (org-insert-upheading  nil))	;C-u C-u
    (t  (org-insert-heading    nil))))


;;; タグ設定
(setq org-tag-alist '(("amazon" . ?a)
                      ("@outside" . ?o) ("@home" . ?h)             ; 場所
                      ("pc" . ?p) ("iphone" . ?i) ("book" . ?b)    ; 必要なもの
                      ("short" . ?s)                                ; かかる時間
                      ))

;;; org-capture の設定 ---------------------------------------------------------
;; デフォルトファイルを指定
(setq org-default-notes-file (concat org-directory "/main.org"))

;; テンプレートを設定
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline nil "Inbox")
         "** TODO %?\n  %i\n  %a")))

;;; ファイル読み込み時、折り畳まない
(setq org-startup-folded nil)
