(require 'package)


;;; パッケージインストールの設定
;;; 参考: http://d.hatena.ne.jp/rubikitch/20130202/all
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; パッケージ インストール先の設定
(setq package-user-dir (concat user-emacs-directory "/packs/live/snufkon-pack/lib"))
