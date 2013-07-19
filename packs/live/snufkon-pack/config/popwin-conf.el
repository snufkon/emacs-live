;;; helm
(push '("*helm.*" :regexp t :height 30) popwin:special-display-config)

;;; nrepl
(push '("*nrepl*" :height 30) popwin:special-display-config)

(push '("*nrepl*" :height 30) popwin:special-display-config)

;;; for kibit
(push '("*compilation*" :noselect t :stick t :height 0.2) popwin:special-display-config)

;;; Emacs 24.3 のバグにより設定値変更
;;; 参考: https://twitter.com/akisute3/statuses/342946097225936896
;;; http://qiita.com/akisute3@github/items/11f20d2bddae7d7bcaea
;;; https://github.com/emacs-jp/issues/issues/2
(setq popwin:close-popup-window-timer-interval 0.2)
