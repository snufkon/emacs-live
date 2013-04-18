(live-add-pack-lib "helm")
(live-add-pack-lib "helm-ls-git")

(require 'helm-config)
(require 'helm-ls-git)

;; (helm-mode 1)
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-g") 'helm-ls-git-ls)
(global-set-key (kbd "C-:") 'helm-do-grep)
(global-set-key (kbd "M-x") 'helm-M-x)
;; (global-set-key (kbd "C-:") 'helm-ls-git-grep)
