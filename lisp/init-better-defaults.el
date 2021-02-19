(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(global-hl-line-mode t)

;;define the liudongdesuiyue in 8ly
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table'(
                                          ;; signature
                                          ("6ly" "liuyue")
                                           ;; eamcs regex
					  ))

;;停止生成副本
(setq make-backup-files nil)

(setq auto-save-default nil)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlighting enclosing parens"
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


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

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(setq dired-dwim-target t)

(defun remove-dos-eol()
  "Replace DOS enlns CR LF with Unix enlns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; dwin = do what i mean.
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)


(set-language-environment "UTF-8")

(defun liuyue/insert-chrome-current-tab-url()
  (interactive)
  (insert (liuyue/retrieve-chrome-current-tab-url)))

(defun liuyue/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
      (let ((result (do-applescript
		     (concat
		      "set frontmostApplication to path to frontmost application\n"
		      "tell application \"Google Chrome\"\n"
		      " set theUrl to get URL of active tab of first window\n"
		      " set theResult to (get theUrl) \n"
		      "end tell\n"
		      "activate application (frontmostApplication as text)\n"
		      "set links to {}\n"
		      "copy theResult to the end of links\n"
		      "return links as string\n"))))
	(format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))



(provide 'init-better-defaults)
