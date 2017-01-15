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
 '(rainbow-delimiters-depth-1-face ((((class color) (background light)) (:foreground "#cdcd00")))) ; yellow
 '(rainbow-delimiters-depth-2-face ((((class color) (background light)) (:foreground "#00cd00")))) ; green
 '(rainbow-delimiters-depth-3-face ((((class color) (background light)) (:foreground "#0000ee")))) ; blue
 '(rainbow-delimiters-depth-4-face ((((class color) (background light)) (:foreground "#cd00cd")))) ; magenta
 '(rainbow-delimiters-depth-5-face ((((class color) (background light)) (:foreground "#00cdcd")))) ; cyan
 '(rainbow-delimiters-depth-6-face ((((class color) (background light)) (:foreground "#cdcd00")))) ; yellow
 '(rainbow-delimiters-depth-7-face ((((class color) (background light)) (:foreground "#00cd00")))) ; green
 '(rainbow-delimiters-depth-8-face ((((class color) (background light)) (:foreground "#0000ee")))) ; blue
 '(rainbow-delimiters-depth-9-face ((((class color) (background light)) (:foreground "#cd00cd")))) ; magenta
 '(rainbow-delimiters-depth-10-face ((((class color) (background light)) (:foreground "#00cdcd")))) ; cyan

)

(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)

; elファイルを読み込むパスを通す
;(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install"))

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

;; マルチウィンドウ制御用 
(require 'rotate)

; diredモードでディレクトリを先に表示
(setq dired-listing-switches "-lXh")

(setq-default c-basic-offset 2     ;;基本インデント量4
   tab-width 2          ;;タブ幅4
   indent-tabs-mode nil)  ;;インデントをタブでするかスペースでするか

;; 改行時に字下げ
(add-hook 'c-mode-common-hook
         '(lambda ()
            ;; RET キーで自動改行+インデント
            (define-key c-mode-base-map "\C-m" 'newline-and-indent)
))

;; Ctrl + a 連打で行頭とインデント先頭を往復
(defun my-move-begin-of-line()
  (interactive)
  (if (bolp) (back-to-indentation) (beginning-of-line) )
)


;; Ctrl + e 連打で行頭とインデント先頭を往復
(defun my-move-end-of-line()
  (interactive)
  (if (eolp) (newline-and-indent)  (end-of-line) )
)


(defun yel-yank ()
"yank to cycle kill ring" (interactive "*")
(if (or (eq last-command 'yank-pop) (eq last-command 'yank))
(yank-pop 1)
(yank 1)))


(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?j)
               (shrink-window-horizontally dx))
              ((= c ?k)
               (enlarge-window dy))
              ((= c ?i)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))

; 現在行をハイライト
;(global-hl-line-mode t)

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


;; find-grep 次回初期値変数
(setq myGrepFindDir (substring (shell-command-to-string "pwd") 0 -1) )
(setq myGrepFindEXT "*.[ch]")
(setq myGrepFindSTR 'nil)

; find-grep デフォルト入力指定
(defun my-grep-find ()
  (interactive)
   ;(setq tmp (substring (shell-command-to-string "pwd") 0 -1) )
   (setq tDIR (read-string "find-grep target Directory: " myGrepFindDir ))
   (setq myGrepFindDir tDIR)
   (setq tEXT (read-string "find-grep target Extention: " myGrepFindEXT ))
   (setq myGrepFindEXT tEXT)
   (setq tSTR (read-string "find-grep target String   : "  ))
   (setq myGrepFindSTR tSTR)
   (setq tcmd (read-string "f.g. : " (format "find %s -type f ! -wholename '*.svn*' ! -wholename '*.git*' -name '%s' | xargs grep  -nIH -i '%s'" tDIR tEXT tSTR)))
;   (setq tcmd (read-string "f.g. : " (format "find %s -type f ! -wholename '*.svn*' -name '*.[ch]' | xargs grep  -nH '%s'" tDIR tSTR)))
   (grep-find (format "%s" tcmd))
)

;;; .emacs.elの末尾に追加
;; grep実施時に複数のバッファで開けるよう設定
(defadvice grep (after my-grep activate)                              ;; grep実施後に実行
  (let ((grep-buffer (get-buffer "*grep*")))                          ;; *grep*バッファをローカル変数に代入
    (set-buffer grep-buffer)                                          ;; カレントバッファを*grep*バッファに設定
    (rename-buffer (concat myGrepFindSTR " *find-grep*"  ) t)   ;; バッファ名をリネームする
  )
)



(defun create-ctags ()
  (interactive)
   (setq tmp (substring (shell-command-to-string "pwd") 0 -1) )
   (setq pat (read-string "ctags taget : " tmp ))
   (setq tcmd (read-string "make ctags : " (format "ctags -Re --languages=c,c++ %s" pat)))
   (shell-command  (format "%s && echo make TAGS successfull " tcmd))
   (shell-command  (format "cp TAGS %s/TAGS 2> /dev/null" pat))
)

; clangにヘッダーパスを通すコマンドを呼ぶ
; カレントディレクトリに makefile or Makefile が存在するかによってデフォルト値を変える
(defun mtn-set-clang-include-path-main()
  (interactive)
  (if (file-exists-p "./makefile") (mtn-set-clang-include-path-makefile)   ; makefileの存在で分岐
   (progn (if (file-exists-p "./Makefile") (mtn-set-clang-include-path-makefile) (mtn-set-clang-include-path-pwd)))   ; Makefileの存在で分岐
  )
)


; 現在カーソルが当たっているワードを選択状態にする
(defun select-current-word()
  (interactive)
  (backward-word)
  (set-mark(point))
  (forward-word)
)

; 現在のカーソル位置から文末までを選択状態にする
(defun select-until-line-end()
  (interactive)
  (set-mark(point))
  (end-of-line)
)



(defun mark-current-line()
  (interactive)
  (beginning-of-line)
  (set-mark(point))
  (end-of-line)
)

(defun delete-current-word(arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (backward-word)
  (delete-region (point) (progn (forward-word arg) (point)))
)

(defun kill-current-word(arg)
  "Kill characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (backward-word)
  (kill-region (point) (progn (forward-word arg) (point)))
)


(defun backward-my-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg))
)

(defun mtn-set-clang-include-path-makefile()
  (interactive)
  (setq ac-clang-cflags
        (split-string
         (shell-command-to-string
          (read-shell-command "clang include path : " "make inc" nil
                              (and buffer-file-name
                                   (file-relative-name buffer-file-name))))))
  (ac-clang-update-cmdlineargs)
)

(defun mtn-set-clang-include-path-pwd()
  (interactive)
  (setq tmp (substring (shell-command-to-string "pwd") 0 -1) )
  (setq ac-clang-cflags
        (split-string
         (shell-command-to-string
          (read-shell-command "set ac-clang option : " (format "-I%s" tmp) nil
                              (and buffer-file-name
                                   (file-relative-name buffer-file-name))))))
  (ac-clang-update-cmdlineargs)
)


; C プログラム解析モード開始
(defun begin-mtn-Studio ()
  (interactive)
  (mtn-set-clang-include-path-main)
  (flymake-mode t)
)


;;; スクロールを一行ずつにする
(setq scroll-step 1)

;;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)

;;; GDB 関連 [begin]
;;; 有用なバッファを開くモード
;(setq gdb-many-windows t)

;;; 変数の上にマウスカーソルを置くと値を表示
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))

;;; I/O バッファを表示
(setq gdb-use-separate-io-buffer t)

;;; t にすると mini buffer に値が表示される
(setq gud-tooltip-echo-area t)

;; レジスタの値を見る
;(gdb-display-registers-buffer)

;; メモリバッファを開く
;(gdb-display-memory-buffer)





;;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)


;;; ショートカットWindows化
(global-set-key "\C-a" 'my-move-begin-of-line)
(global-set-key "\C-b" 'buffer-menu)
(global-set-key "\C-e" 'my-move-end-of-line)
(global-set-key "\C-f" 'backward-word)
(global-set-key "\C-l" 'forward-word)
(global-set-key "\C-o" 'other-window)
(global-set-key "\C-v" 'yank)
(global-set-key (kbd "C-S-v") 'yel-yank)
(global-set-key "\C-w" 'select-current-word)
;(global-set-key "\C-i" 'delete-current-word)
(global-set-key "\C-x\C-x" 'kill-region)
(global-set-key "\C-z" 'undo)
(global-set-key [home] 'beginning-of-line)
(global-set-key [select] 'end-of-line)
(global-set-key [?\C-x home] 'beginning-of-buffer)
(global-set-key [?\C-x select] 'end-of-buffer)
(global-set-key "\C-xj" 'goto-line)
(global-set-key "\C-xn" 'linum-mode)
;(global-set-key "\C-," 'scroll-up-command)
;(global-set-key "\C-." 'scroll-down-command)
(global-set-key "\C-]" 'execute-extended-command)
(global-set-key "\C-m" 'newline-and-indent)

(global-set-key [f2] 'pop-tag-mark)
(global-set-key [?\C-x f2] 'visit-tags-table)
(global-set-key [f3] 'find-tag)
(global-set-key [?\C-x f3] 'create-ctags)
(global-set-key [f4] 'find-tag-other-window)

;; call "GDB"
(global-set-key [f5] 'gdb)
;; call "compile"
(global-set-key [f6] 'compile)
;; occur make list str
(global-set-key [f7] 'occur)
;; grep
(global-set-key [f8] 'my-grep-find)
;; GDB, go to selected line
(global-set-key [f9] 'gud-jump)
;; GDB, one line do. not call function
(global-set-key [f10] 'gud-next)
;; GDB, one line do. jump into function
(global-set-key [f11] 'gud-step)
;; GDB, do until end of current function
(global-set-key [?\C-x f11] 'gud-finish)
;; Paste history
(global-set-key [f12] 'undo-tree-visualize)
(global-set-key [?\C-x f12] 'delete-my-word)


(global-set-key "\C-q" nil)
(global-set-key "\C-q\C-q" 'nil)
(global-set-key "\C-qa" 'mark-whole-buffer)
(global-set-key "\C-q\C-a" 'mark-current-line)
(global-set-key "\C-q\C-c" 'copy-region-as-kill)
(global-set-key "\C-qc" 'copy-region-as-kill)
(global-set-key "\C-qq" 'begin-mtn-Studio)
;(global-set-key "\C-q\C-o" (lambda () (interactive) (other-window -1)))
(global-set-key "\C-q\C-t" 'find-tag-other-window)
(global-set-key "\C-q\C-r" 'query-replace)
(global-set-key "\C-q\C-t" 'find-tag)
(global-set-key "\C-q\C-b" 'pop-tag-mark)
(global-set-key "\C-qg" 'grep)
(global-set-key "\C-q\C-i" 'open-config-file)
(global-set-key "\C-qh" 'open-myhelp-file)
(global-set-key "\C-qd" 'describe-bindings)
(global-set-key "\C-q\C-l" 'align-regrep)
(global-set-key "\C-q\C-k" 'yas-describe-tables)
(global-set-key "\C-q\C-s" 'window-resizer)
(global-set-key "\C-q\C-e" 'toggle-truncate-lines)
(global-set-key "\C-q\C-p" 'beginning-of-buffer)
(global-set-key "\C-q\C-n" 'end-of-buffer)
(global-set-key "\C-q\C-v" 'view-mode)
(global-set-key "\C-q\C-x" 'exchange-point-and-mark)
(global-set-key "\C-q\C-w" 'rotate-window)

(global-set-key "\C-q1" 'rotate-window)
(global-set-key "\C-q2" 'rotate:main-vertical)
(global-set-key "\C-q3" 'rotate:main-horizontal)
(global-set-key "\C-q4" 'rotate:even-vertical)
(global-set-key "\C-q5" 'rotate:even-horizontal)
(global-set-key "\C-q6" 'rotate:tiled)
(global-set-key "\C-q0" 'rotate-layout)
(global-set-key "\C-q\C-o" 'rotate-window)
(global-set-key "\C-x\C-n" 'scroll-up)
(global-set-key "\C-x\C-p" 'scroll-down)



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




;; anything
(require 'anything)
(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)
(global-set-key "\C-ql" 'anything)
(global-set-key "\C-q\C-l" 'anything-for-files)

;; kill-ring borwser
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;(global-set-key (kbd "C-y") 'browse-kill-ring)
;(global-set-key (kbd "C-y") 'anything-show-kill-ring)
(global-set-key "\C-q\C-y" 'anything-show-kill-ring)

;; 履歴保存
(require 'stash)

;; 永続化したい変数を宣言する
;;; (or stashed 'nil)は読み込み時にデフォルトでnilにするおまじない
(defstash kill-ring "kill-ring.el" nil (or stashed 'nil))
(defstash minibuffer-history "minibuffer-history.el" nil (or stashed 'nil))


;; gdb モードでのキーバインド 過去のコマンドを呼び出す
(add-hook 'gdb-mode-hook
          '(lambda()
             (local-set-key "\C-p" 'comint-previous-input)
             (local-set-key "\C-n" 'comint-next-input)
           )
)

; view-mode 関連の設定
(add-hook 'find-file-hook
          '(lambda ()
             (interactive)
             (view-mode)
           )
)
(require 'viewer)
(setq viewer-modeline-color-unwritable "#cd0000")
(setq viewer-modeline-color-view "#cdcd00")
(viewer-change-modeline-color-setup)
; view-mode におけるキーバインド
(define-key view-mode-map (kbd "<DEL>") 'nil)
(define-key view-mode-map (kbd "<RET>") 'nil)
(define-key view-mode-map (kbd "<SPC>") 'nil)
(define-key view-mode-map (kbd "q") 'view-mode)
(define-key view-mode-map (kbd "u") 'view-mode)
(define-key view-mode-map (kbd "a") 'beginning-of-buffer)
(define-key view-mode-map (kbd "e") 'end-of-buffer)
(define-key view-mode-map (kbd "n") 'scroll-up)
(define-key view-mode-map (kbd "p") 'scroll-down)
(define-key view-mode-map (kbd "i") 'previous-line)
(define-key view-mode-map (kbd "j") 'backward-word)
(define-key view-mode-map (kbd "l") 'forward-word)
(define-key view-mode-map (kbd "k") 'next-line)
(define-key view-mode-map (kbd "o") 'mark-current-line)
(define-key view-mode-map (kbd "m") 'set-mark)
(define-key view-mode-map (kbd "c") 'copy-region-as-kill)
(define-key view-mode-map "\C-k" 'select-until-line-end)
;  (backward-word)
 ; (set-mark(point))
  ;(forward-word)





;; ファイルなら別バッファで、ディレクトリなら同じバッファで開く
(defun dired-open-file-not ()
  (interactive)
  (let ((file (dired-get-filename)))
    (if (file-directory-p file) (dired-find-file) (message "File Selected") )))

;; dired-find-alternate-file の有効化
(put 'dired-find-alternate-file 'disabled nil)
;; RET 標準の dired-find-file では dired バッファが複数作られるので
;; dired-find-alternate-file を代わりに使う
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "a") 'dired-find-file)

;; ディレクトリの移動キーを追加(wdired 中は無効)
(define-key dired-mode-map (kbd "<left>") 'dired-up-directory)
;(define-key dired-mode-map (kbd "<right>") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "<right>") 'dired-open-file-not)



;; auto-install [begin]
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install")
(setq auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
;; auto-install [end]

;; atuto-compete-clang [begin]
(require 'auto-complete-clang-async)

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process)
)

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)
;; atuto-compete-clang [end]


;; flymake [begin]
; flymake file include
(require 'flymake)
;; flymake [end]


;; yasnippet [begin]
;; パスを通す
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/elpa/yasnippet/"))

;; 自分用・追加用テンプレート -> mysnippetに作成したテンプレートが格納される
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/mysnippets"
        "~/.emacs.d/yasnippets"
        ))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

(yas-global-mode 1)

;(global-set-key "\C-qy" 'yas-expand)
(global-set-key "\C-y" 'yas-expand)

;(keyboard-translate ?\C-i ?\H-i)
;(global-set-key [?\H-i] 'yas-expand)


;; ファイル末尾の改行を削除
;; http://www.emacswiki.org/emacs/DeletingWhitespace
(defun my-delete-trailing-blank-lines ()
    "Deletes all blank lines at the end of the file."
  (interactive)
  (save-excursion
   (save-restriction
   (widen)
   (goto-char (point-max))
   (delete-blank-lines))
  )
  (save-excursion
   (save-restriction
   (goto-char (point-max))
   (newline))
  )
)

(add-hook 'before-save-hook 'my-delete-trailing-blank-lines)


;; 以下が Mac 用のフォント設定
(when (memq window-system '(mac ns))
  (global-set-key [s-mouse-1] 'browse-url-at-mouse)
  (let* ((size 14)
	 (jpfont "Hiragino Maru Gothic ProN")
   (asciifont "Monaco")
	 (h (* size 10)))
    (set-face-attribute 'default nil :family asciifont :height h)
    (set-fontset-font t 'katakana-jisx0201 jpfont)
    (set-fontset-font t 'japanese-jisx0208 jpfont)
    (set-fontset-font t 'japanese-jisx0212 jpfont)
    (set-fontset-font t 'japanese-jisx0213-1 jpfont)
    (set-fontset-font t 'japanese-jisx0213-2 jpfont)
    (set-fontset-font t '(#x0080 . #x024F) asciifont))
  (setq face-font-rescale-alist
	'(("^-apple-hiragino.*" . 1.2)
	  (".*-Hiragino Maru Gothic ProN-.*" . 1.2)
	  (".*osaka-bold.*" . 1.2)
	  (".*osaka-medium.*" . 1.2)
	  (".*courier-bold-.*-mac-roman" . 1.0)
	  (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
	  (".*monaco-bold-.*-mac-roman" . 0.9)
	  ("-cdac$" . 1.3)))
  ;; C-x 5 2 で新しいフレームを作ったときに同じフォントを使う
  (setq frame-inherited-parameters '(font tool-bar-lines))
)


;; 起動時のサイズ,表示位置,フォントを指定
(setq initial-frame-alist
      (append (list
	       '(width . 150)
	       '(height . 45)
	       '(top . 0)
	       '(left . 0)
	       )
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

