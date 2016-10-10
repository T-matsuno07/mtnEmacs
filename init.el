(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((((class color) (background light)) (:foreground "#FFFFFF"))))
 '(rainbow-delimiters-depth-2-face ((((class color) (background light)) (:foreground "#009944"))))
 '(rainbow-delimiters-depth-3-face ((((class color) (background light)) (:foreground "#1D2088"))))
 '(rainbow-delimiters-depth-4-face ((((class color) (background light)) (:foreground "#F39800"))))
 '(rainbow-delimiters-depth-5-face ((((class color) (background light)) (:foreground "#009e96"))))
 '(rainbow-delimiters-depth-6-face ((((class color) (background light)) (:foreground "#920783"))))
 '(rainbow-delimiters-depth-7-face ((((class color) (background light)) (:foreground "#FFF1F0"))))
 '(rainbow-delimiters-depth-8-face ((((class color) (background light)) (:foreground "#E5004F"))))
 '(rainbow-delimiters-depth-9-face ((((class color) (background light)) (:foreground "#E4007F")))))
; dont make auto save file FILENAME~
(setq make-backup-files nil)

; dont make auto save file #FILENAME#
(setq auto-save-default nil)

; pare () stress
(show-paren-mode t)

; 言語を日本語にする
(set-language-environment 'Japanese)
; 極力UTF-8とする
(prefer-coding-system 'utf-8)


;; 改行時に字下げ
(add-hook 'c-mode-common-hook
         '(lambda ()
            ;; RET キーで自動改行+インデント
            (define-key c-mode-base-map "\C-m" 'newline-and-indent)
))


(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))


(defun yel-yank () 
"yank to cycle kill ring" (interactive "*") 
(if (or (eq last-command 'yank-pop) (eq last-command 'yank)) 
(yank-pop 1) 
(yank 1))) 



; メニューバーを消す
(menu-bar-mode 0)

;;; リージョンを削除できるように
(delete-selection-mode t)

;; 行番号を左側に表示
(global-linum-mode t)

;;; 行番号と桁番号を表示する
(line-number-mode t)
(column-number-mode t)

;; 履歴を次回emacsにも表示する
(savehist-mode t)

;; キーストロークをエコーエリアにすぐに表示する
(setq echo-keystrokes 0.1)

;; yesと入力するのは面倒なのでyで十分
(defalias 'yes-or-no-p 'y-or-n-p)


;;; GDB 関連
;;; 有用なバッファを開くモード
(setq gdb-many-windows t)

;;; 変数の上にマウスカーソルを置くと値を表示
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))

;;; I/O バッファを表示
(setq gdb-use-separate-io-buffer t)

;;; t にすると mini buffer に値が表示される
(setq gud-tooltip-echo-area nil)

;;; ショートカットWindows化
(global-set-key "\C-b" 'buffer-menu)
(global-set-key "\C-o" 'other-window)
(global-set-key "\C-v" 'yank)
(global-set-key "\C-w" 'delete-window)
(global-set-key "\C-x\C-x" 'kill-region)
(global-set-key "\C-z" 'undo)
(global-set-key "\C-y" 'yel-yank)
(global-set-key [home] 'beginning-of-line)
(global-set-key [select] 'end-of-line)
(global-set-key [?\C-x home] 'beginning-of-buffer)
(global-set-key [?\C-x select] 'end-of-buffer)
(global-set-key "\C-xj" 'goto-line)
(global-set-key "\C-xn" 'linum-mode)
(global-set-key "\C-]" 'execute-extended-command)

;; GDB, one line do. not call function
(global-set-key [f5] 'gud-next)
;; GDB, one line do. jump into function
(global-set-key [f6] 'gud-step)
;; GDB, do until end of current function
(global-set-key [f7] 'gud-finish)
;; Paste history
(global-set-key [f8] 'yel-yank)
;; Start shell  Alt-X shell
(global-set-key [f9] 'shell)
;; call "GDB"
(global-set-key [f10] 'gdb)
;; call "compile"
(global-set-key [f11] 'pop-tag-mark)
;; call "Undo" Ctrl-X Uo
(global-set-key [f12] 'find-tag-other-window)

(global-set-key "\C-q" nil)
(global-set-key "\C-qa" 'mark-whole-buffer)
(global-set-key "\C-q\C-c" 'copy-region-as-kill)
(global-set-key "\C-qc" 'copy-region-as-kill)
(global-set-key "\C-q\C-q" 'other-window)
(global-set-key "\C-qq" (lambda () (interactive) (other-window -1)))
(global-set-key "\C-q\C-t" 'find-tag-other-window)
(global-set-key "\C-qr" 'query-replace)
(global-set-key "\C-qt" 'find-tag)
(global-set-key "\C-qb" 'pop-tag-mark)
(global-set-key "\C-qg" 'grep)
(global-set-key "\C-qi" 'open-config-file)
(global-set-key "\C-qh" 'open-myhelp-file)
(global-set-key "\C-qd" 'describe-bindings)
;(global-set-key (kbd "C-q" "C-t") '(lambda () (interactive) (other-window -1))



(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3")
(setq ac-dir "auto-complete-1.3/")
(add-to-list 'load-path ac-dir)
(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'ac-dictionary-directories (concat ac-dir "ac-dict/"))

(global-set-key "\M-/" 'ac-start)
;; C-n/C-p で候補を選択
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

(add-to-list 'load-path "~/.emacs.d/rainbow-delimiters")
(require 'rainbow-delimiters)
 ;; rainbow-delimiters-mode
 (defun my-rainbow-delimiters-mode-turn-on ()
   (rainbow-delimiters-mode t))  
 (add-hook 'emacs-lisp-mode-hook 'my-rainbow-delimiters-mode-turn-on)
 (add-hook 'c-mode-common-hook 'my-rainbow-delimiters-mode-turn-on)

;; emacsのコンフィグファイルを開く
(defun open-config-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
)


;; 自作したヘルプファイルを開く
(defun open-myhelp-file()
  (interactive)
  (find-file "~/.emacs.d/myhelp.txt")
)

;; shell-mode キーバインド
;; Ctrl + [n,p]でコマンド履歴を遡る戻る
(add-hook 'shell-mode-hook
  (lambda()
    (define-key shell-mode-map (kbd  "C-p") 'comint-previous-input)
    (define-key shell-mode-map (kbd  "C-n") 'comint-next-input)
  )
)

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install")
(setq auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

(require 'anything-config)