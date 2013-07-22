(live-add-pack-lib "recentf-ext-20130130.2150")



;;; 参考: http://d.hatena.ne.jp/tomoya/20110217/1297928222
(setq recentf-max-saved-items 2000)
(setq recentf-exclude '(".recentf"))
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer
      (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode 1)

;;; 参考: http://d.hatena.ne.jp/rubikitch/20091224/recentf
(require 'recentf-ext)
