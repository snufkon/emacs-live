
;;; テキストのスケールを拡大、縮小
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;;; helm
;; (global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x C-g") 'helm-ls-git-ls)
(global-set-key (kbd "C-:") 'helm-do-grep)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-;") 'helm-git-project)

;;; ウィンドウ最大、最小化
(key-chord-define-global "89" 'mac-toggle-max-window)

;;; ウィンドウ分割
(global-set-key (kbd "C-t") 'other-window-or-split)


;;; ウィンドウの透過率を増加、減少
(define-key global-map (kbd "C-s-.") 'blind-up)
(define-key global-map (kbd "C-s-,") 'blind-down)

;;; expand-region
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region)

;;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;; paredit-mode
(define-key paredit-mode-map (kbd "M-[") 'comment-sexp)

;;; open-junk-file
(global-set-key (kbd "C-x j") 'open-junk-file)


;;; yasnippet
;;; 参考: http://fukuyama.co/yasnippet
;;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
;;; (setqだとtermなどで干渉問題ありでした)
;;; もちろんTAB以外でもOK 例えば "C-;"とか
;;;(custom-set-variables '(yas-trigger-key "TAB"))

;;; 参考: https://github.com/capitaomorte/yasnippet/issues/296
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas/expand)
(define-key yas-minor-mode-map (kbd "TAB") nil)

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x y i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x y n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x y v") 'yas-visit-snippet-file)

;;; bm.el
(global-set-key (kbd "M-@") 'bm-toggle)
(global-set-key (kbd "C-.") 'bm-next)
(global-set-key (kbd "C-,") 'bm-previous)
