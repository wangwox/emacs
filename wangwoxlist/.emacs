
;;--转移emacs的配置文件
;;首先，我们再来看看emacs的简单安装吧，http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-23.2-bin-i386.zip 这里下载emacs-23.2最新版，并解压到一个磁盘根目录，我这里放在了d:\下，解压后，得到 d:\emacs-23.2，进入d:\emacs-23.2\bin目录，执行 addpm.exe 在开始菜单中加入 emacs 的启动项。
;;启动emacs，在 Option 菜单中随便更改一下设置，如 取消 Case-Insensitive Search，之后，点 Save Options。这一步不是多余的哦，因为默认情况下emacs不会在一启动的时候就生成 .emacs 配置文件和 .emacs.d目录的。这步生成的 .emacs 目录还是在 C:\Users\<username>\AppData\Roaming 下，因为我们并没有做别的设置移动它嘛~
;;下面就进入关键步骤了，打开 C:\Users\<username>\AppData\Roaming\.emacs 配置文件，修改内容为
;; (load-file "D:/emacs-23.2/.emacs")
;;这个配置意思很明显了，emacs在启动的时候会加载 C:\Users\<username>\AppData\Roaming\.emacs 这个配置文件，而该文件又加载另一个 D:/emacs-23.2/.emacs 配置文件。这样，自然就成功实现了配置的转移喽~好了，从现在起就不用进入 C:\Users\<username>\AppData\Roaming\.emacs 这个冗的路径喽！
;;上一步，我们把emacs的配置文件用 (load-file ...) 配置已经指向到 D:/emacs-23.2/.emacs
;;了，那两个就拷贝一个 .emacs 文件放到 D:/emacs-23.2/ 里吧（Windows下好像不能建立以 . 开头的文件吧）。然后，打开D:/emacs-23.2/.emacs，在开头添加如下配置：
;; (setenv "HOME" "D:/emacs-23.2")  (setenv "PATH" "D:/emacs-23.2")  ;;set the default file path 
;;(setq default-directory "~/")
;;复制代码
;;恩，是的，这里重新给 HOME PATH 等定义了新的路径~~~写到这里大家该明白了，就是把配置转移了一下而已。
;;好了，现在就可以了把 D:/emacs-23.2 当成emacs的 HOME了
;;这里重新给 HOME PATH 等定义了新的路径~~~
;;写到这里大家该明白了，就是把配置转移了一下而已。 
;;现在就可以了把 D:/anzhuang/emacs 当成emacs的 HOME了
(setenv "HOME" "D:/anzhuang/emacs")
(setenv "PATH" "D:/anzhuang/emacs")
;;set the default file path 
(setq default-directory "~/")
;;(load-file "D:/anzhuang/emacs/wangwoxlist/.emacs")




;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("25ed1d587f51389966b4bbe883b257a2f35289eb2791dcfc74624f8ee7804ad9" default)))
 '(display-time-mode t)
 '(package-selected-packages (quote (company)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 105 :width normal)))))



;;不要生成临时文件
(setq-default make-backup-files nil)


;; 一打开就起用 text 模式。
(setq default-major-mode 'text-mode)

;; 语法高亮
(global-font-lock-mode t)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示括号匹配
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t) 

;;自定义路径，选择theme
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

 ;;================================ 
 ;;为我的emacs配置主题色彩 (color-theme-色彩名称) 
 ;;================================ 
;; (require 'color-theme) 
;; (color-theme-initialize)
;; (color-theme-charcoal-black)

;;使用自己的第三方主题
;;Download molokai-theme.el to the directory ~/.emacs.d/themes/. And add this to your emacs dotfile:
(add-to-list 'custom-theme-load-path "~/wangwoxlist/waibulist/themes")
(load-theme 'molokai t)




;手动折行（用f12键，可以自己改）（可以在打开和取消自动折行间切换）
(global-set-key [f12] 'toggle-truncate-lines)


;;F11键切换透明(五种透明级别)，仅适用于GUI界面，不适合终端。
(global-set-key [(f11)] 'loop-alpha)
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
)

;;一键调转到行中，C-z
(defun middle-of-line ()
  "Put cursor at the middle point of the line."
  (interactive)
  (goto-char (/ (+ (point-at-bol) (point-at-eol)) 2)))
(global-set-key (kbd "C-z") 'middle-of-line)


;;光标靠近鼠标的时候，鼠标自动弹开。
(mouse-avoidance-mode 'animate)

;;关闭烦人的出错时的提示声 
(setq visible-bell t) 
;;关闭emacs启动时的画面 
(setq inhibit-startup-message t)

;设置打开文件缺省目录 
(setq default-directory "E:/计算机相关学习及研究/学习笔记/org")

;; 在行首 C-k 时，同时删除该行。 
(setq-default kill-whole-line t) 



;;------------------org.mode相关-----------------

;;把自己下载的org添加到加载目录中
;;注意，不要把其它的org相关的置于此配置之上。
(setq load-path (cons "~/wangwoxlist/waibulist/org-8.3.2/lisp" load-path))
(setq load-path (cons "~/wangwoxlist/waibulist/org-8.3.2/contrib/lisp" load-path))

;;激活org用的
;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;;设置加载的运行语言：方便在org-mode中直接求出运行结果。
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   (C . t)
   ))


;;org的导出思维导图功能
(require 'ox-freemind)

;;org的自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))


;;org-mode中嵌套的的代码高亮
(setq org-src-fontify-natively t)


;;下面的定制为笔记设置了一个默认的目标文件，并为捕获新的任务定义了一个全局快捷键。
;;注意自定义路径，需要使用正斜杠，否则无效。
;;(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-default-notes-file (concat "E:/计算机相关学习及研究/学习笔记/org/notes.org"))
(define-key global-map "\C-cc" 'org-capture)


;; 捕获模板
;;用可以用不同的模板来做不同的捕获笔记，并将它们保存到不同的地方。例如，你想将新任务保存到文件“TODO.org”的“Tasks”标题下，而将日记项目保存到“journal.org”中一个时间树中。你可以：
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "E:/计算机相关学习及研究/学习笔记/org/notes2.org" "Tasks")
         "* TODO %?\n %i\n %a")
        ("j" "Journal" entry (file+datetree "E:/计算机相关学习及研究/学习笔记/org/notes1.org")
         "* %?\nEntered on %U\n %i\n %a")))
;;其中，第一个字符串是模式的关键字，第二个字符串是简短的描述信息。接着是条目的类型和保存笔记的目标地址。最后是模板本身，它利用%作转义符基于时间和上下文来填充一些信息。 


;;---未测试
;;需要做一个配置，目的是要让agenda view知道，它应该从哪些个org文件里面取数据。
;;在你的.emacs文件中，添加：
;;(setq org-agenda-files (list "~/doc/org/linux.org"
;;                     "~/doc/org/work.org"
;;                     "~/doc/org/home.org"))



;;Org虽然没有定义专门的日程表类型的文件，但要产生特定的日程表总不能天南海北的胡乱查找任务，所以要先指定一些（org）文件为搜索范围。这可以通过设置 org-agenda-files 变量完成，如：
(setq org-agenda-files (list "E:/计算机相关学习及研究/学习笔记/org"))
;;(setq org-agenda-files (list "D:/agenda"))
;;会把 D:/agenda 目录下（不包括子目录）的所有org文件都加入到日程表的搜索范围。也可以使用下面的快捷键逐个添加或删除：
;;    C-c [ ：把当前文件加到 agenda-files 列表的最前面；如果文件已经在 agenda-files 中，就把移到最列表最前面或最后面。
;;    C-c ] ：把当前文件从 agenda-files 列表移除


;;---未测试
;;    在init.el配置文件中设置某类文件的编辑模式为org，如txt类文件：
;;(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))




;;--------------------编程相关------------------

;;把gcc编译环境加入到PATH中
;;我的win7系统或者emacs可能有问题，按理说emacs会自动把PATH路径的文件加入到自己的path中，但是没有，所以我只能手动把系统环境变量的path复制过来了。
;;主要用于外部调用一些命令行的命令，最简单的如gcc的编译c语言的命令
;;以后如果换了系统，看看如果不需要，就删除得了。
(setenv "PATH"
  (concat
   "D:\anzhuang\android-ndk-r10e" ";"
   "D:/anzhuang/mingw/bin" ";"
   "%JAVA_HOME%/bin" ";"
   "C:/ProgramData/Oracle/Java/javapath" ";"
   "%SystemRoot%/system32" ";"
   "%SystemRoot%" ";"
   "%SystemRoot%/System32/Wbem" ";"
   "%SYSTEMROOT%/System32/WindowsPowerShell/v1.0/" ";"
   "D:/anzhuang/MySQL/bin" ";"
   "D:/anzhuang/androidsdk/adt-bundle-windows-x86_64-20140702/sdk/platform-tools" ";"
   "D:/anzhuang/emacs/bin" ";"
   (getenv "PATH")
   )
 )


;;自动补全功能
(add-to-list 'load-path "/path/to/company")
(autoload 'company-mode "company" nil t)
