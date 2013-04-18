
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;;; Todo: 起動時のウィンドウ幅が倍になるバグにパッチを当てる
;;; 参照: http://blog.nyarla.net/2011/10/28/1
(let* ((size 16)
           (asciifont "Ricty")          ; ASCII fonts
           (jpfont "Ricty")             ; Japanese fonts
           (h (* size 10))
           (fontspec (font-spec :family asciifont))
           (jp-fontspec (font-spec :family jpfont)))
      (set-face-attribute 'default nil :family asciifont :height h)
      (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
      (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
      (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
      (set-fontset-font nil '(#x0080 . #x024F) fontspec)
      (set-fontset-font nil '(#x0370 . #x03FF) fontspec))
