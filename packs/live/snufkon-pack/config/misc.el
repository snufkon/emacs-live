;;; モードラインに情報を追加
;; 時間を表示
(display-time-mode 1)

;;; 透過ウィンドウに設定(Macのみ)
;; TODO 透過率を変更するコマンドを作成して、キー入力できるようにする
(when (or
       (eq window-system 'mac)
       (eq window-system 'ns))
  (set-frame-parameter nil 'alpha 90))

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

;;; バッファ自動再読み込み
(global-auto-revert-mode 1)

;;; 使い捨てファイル作成用
(require 'open-junk-file)
(setq open-junk-file-format "~/Code/junk/%Y-%m/%Y-%m-%d-%H%M%S.")


;;; ウィンドウ分割の横、縦を切り替える
;;; 参考: http://whattheemacsd.com/
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))


;; 参考: http://d.hatena.ne.jp/CortYuming/20130622/p1
;; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))
