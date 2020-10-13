 ;; cl - Common Lisp Extension
(require 'cl)

(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像



 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		popwin
		reveal-in-osx-finder
		;; --- Major Mode ---
		js2-mode
		web-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		js2-refactor
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		) "Default packages")


(setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

(require 'hungry-delete)
(global-hungry-delete-mode)

(delete-selection-mode t)

;;smartparens
;;(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;;config for js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode)
	 ("\\.rkt\\'" . scheme-mode))
       auto-mode-alist))




(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
;;swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(global-company-mode t)

;; config for web mode
(defun my-web-mode-indent-setup()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;; config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
