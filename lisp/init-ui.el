
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

;; 更改光标的样式
(setq-default cursor-type 'bar)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 显示行号
(global-linum-mode t)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 100)


(provide 'init-ui)
