(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(global-hl-line-mode t)

;;define the liudongdesuiyue in 8ly
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table'(
                                          ;; signature
                                          ("8ly" "liudongdesuiyue")
                                           ;; eamcs regex
					  ))

;;停止生成副本
(setq make-backup-files nil)

(setq auto-save-default nil)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-defaults)
