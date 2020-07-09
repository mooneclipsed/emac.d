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


(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent region selected otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-enf))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(setq hippie-expand-try-function-list '(try-expand-dabbrev
					try-expand-dabbrev-all-buffer
					try-expand-dabbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-dabbrev
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))


(provide 'init-better-defaults)

