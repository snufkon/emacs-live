


;;; モードラインに情報を追加
;; 時間を表示
(display-time-mode 1)

;;; 透過ウィンドウに設定(Macのみ)
;; TODO 透過率を変更するコマンドを作成して、キー入力できるようにする
(when (or
       (eq window-system 'mac)
       (eq window-system 'ns))
  (set-frame-parameter nil 'alpha 80))

;;; ウィンドウ最大化用トグル(Mac用)
(defun mac-toggle-max-window ()
  (interactive)
  (if (>= emacs-major-version 23)
      (ns-toggle-fullscreen)
    (if (frame-parameter nil 'fullscreen)
	(set-frame-parameter nil 'fullscreen nil)
      (set-frame-parameter nil 'fullscreen 'fullboth))))


;;; ファイル名重複時にバッファ名をわかりやすくする
(require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたバッファ名は対象外にする
(setq uniquify-ignore-buffers-re "*[^*]+*")

;;; ファイル名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;;; ウィンドウ分割をいけてるかんじにする
;; 参考: http://d.hatena.ne.jp/rubikitch/20100210/emacs
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
