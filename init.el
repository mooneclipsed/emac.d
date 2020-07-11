(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")


;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; add more personal func
;; new init-func.el

;; (require 'init-func)

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))


;;(load-file custom-file)





