
;; テキストのスケールを拡大、縮小
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; helm
;; (global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)

;; ウィンドウ最大、最小化
(key-chord-define-global "89" 'mac-toggle-max-window)

;; ウィンドウ分割
(global-set-key (kbd "C-t") 'other-window-or-split)
(global-set-key [(C-tab)] 'other-window-or-split)

;; ;; ウィンドウの透過率を増加、減少
(define-key global-map (kbd "C-.") 'blind-up)
(define-key global-map (kbd "C-,") 'blind-down)

;; expand-region
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region)

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
