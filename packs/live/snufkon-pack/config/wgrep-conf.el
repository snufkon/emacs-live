(live-add-pack-lib "wgrep")

(require 'wgrep)

;;; *grep* バッファ中から編集モードに切り替えるキーを設定
(setq wgrep-enable-key "r")

;;; wgrep 上での編集反映時、バッファを自動保存する
(setq wgrep-auto-save-buffer t)
