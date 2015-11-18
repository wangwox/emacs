;;�������¸� HOME PATH �ȶ������µ�·��~~~
;;д�������Ҹ������ˣ����ǰ�����ת����һ�¶��ѡ� 
;;���ھͿ����˰� D:/anzhuang/emacs ����emacs�� HOME��
(setenv "HOME" "D:/anzhuang/emacs")
(setenv "PATH" "D:/anzhuang/emacs")
;;set the default file path 
(setq default-directory "~/") 


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



;;��Ҫ������ʱ�ļ�
(setq-default make-backup-files nil)


;; һ�򿪾����� text ģʽ��
(setq default-major-mode 'text-mode)

;; �﷨����
(global-font-lock-mode t)

;; �� y/n���� yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; ��ʾ����ƥ��
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; ��ʾʱ�䣬��ʽ����
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t) 

;;�Զ���·����ѡ��theme
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

 ;;================================ 
 ;;Ϊ�ҵ�emacs��������ɫ�� (color-theme-ɫ������) 
 ;;================================ 
;; (require 'color-theme) 
;; (color-theme-initialize)
;; (color-theme-charcoal-black)

;;ʹ���Լ��ĵ���������
;;Download molokai-theme.el to the directory ~/.emacs.d/themes/. And add this to your emacs dotfile:
(add-to-list 'custom-theme-load-path "~/wangwoxlist/waibulist/themes")
(load-theme 'molokai t)




;�ֶ����У���f12���������Լ��ģ��������ڴ򿪺�ȡ���Զ����м��л���
(global-set-key [f12] 'toggle-truncate-lines)


;;F11���л�͸��(����͸������)����������GUI���棬���ʺ��նˡ�
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

;;һ����ת�����У�C-z
(defun middle-of-line ()
  "Put cursor at the middle point of the line."
  (interactive)
  (goto-char (/ (+ (point-at-bol) (point-at-eol)) 2)))
(global-set-key (kbd "C-z") 'middle-of-line)


;;��꿿������ʱ������Զ�������
(mouse-avoidance-mode 'animate)

;;�رշ��˵ĳ���ʱ����ʾ�� 
(setq visible-bell t) 
;;�ر�emacs����ʱ�Ļ��� 
(setq inhibit-startup-message t)

;���ô��ļ�ȱʡĿ¼ 
(setq default-directory "E:/��������ѧϰ���о�/ѧϰ�ʼ�/org")

;; ������ C-k ʱ��ͬʱɾ�����С� 
(setq-default kill-whole-line t) 



;;------------------org.mode���-----------------

;;���Լ����ص�org��ӵ�����Ŀ¼��
;;ע�⣬��Ҫ��������org��ص����ڴ�����֮�ϡ�
(setq load-path (cons "~/wangwoxlist/waibulist/org-8.3.2/lisp" load-path))
(setq load-path (cons "~/wangwoxlist/waibulist/org-8.3.2/contrib/lisp" load-path))

;;����org�õ�
;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;;���ü��ص��������ԣ�������org-mode��ֱ��������н����
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


;;org�ĵ���˼ά��ͼ����
(require 'ox-freemind)

;;org���Զ�����
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))


;;org-mode��Ƕ�׵ĵĴ������
(setq org-src-fontify-natively t)


;;����Ķ���Ϊ�ʼ�������һ��Ĭ�ϵ�Ŀ���ļ�����Ϊ�����µ���������һ��ȫ�ֿ�ݼ���
;;ע���Զ���·������Ҫʹ����б�ܣ�������Ч��
;;(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-default-notes-file (concat "E:/��������ѧϰ���о�/ѧϰ�ʼ�/org/notes.org"))
(define-key global-map "\C-cc" 'org-capture)


;; ����ģ��
;;�ÿ����ò�ͬ��ģ��������ͬ�Ĳ���ʼǣ��������Ǳ��浽��ͬ�ĵط������磬���뽫�����񱣴浽�ļ���TODO.org���ġ�Tasks�������£������ռ���Ŀ���浽��journal.org����һ��ʱ�����С�����ԣ�
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "E:/��������ѧϰ���о�/ѧϰ�ʼ�/org/notes2.org" "Tasks")
         "* TODO %?\n %i\n %a")
        ("j" "Journal" entry (file+datetree "E:/��������ѧϰ���о�/ѧϰ�ʼ�/org/notes1.org")
         "* %?\nEntered on %U\n %i\n %a")))
;;���У���һ���ַ�����ģʽ�Ĺؼ��֣��ڶ����ַ����Ǽ�̵�������Ϣ����������Ŀ�����ͺͱ���ʼǵ�Ŀ���ַ�������ģ�屾��������%��ת�������ʱ��������������һЩ��Ϣ�� 


;;---δ����
;;��Ҫ��һ�����ã�Ŀ����Ҫ��agenda view֪������Ӧ�ô���Щ��org�ļ�����ȡ���ݡ�
;;�����.emacs�ļ��У���ӣ�
;;(setq org-agenda-files (list "~/doc/org/linux.org"
;;                     "~/doc/org/work.org"
;;                     "~/doc/org/home.org"))



;;Org��Ȼû�ж���ר�ŵ��ճ̱����͵��ļ�����Ҫ�����ض����ճ̱��ܲ������Ϻ����ĺ��Ҳ�����������Ҫ��ָ��һЩ��org���ļ�Ϊ������Χ�������ͨ������ org-agenda-files ������ɣ��磺
(setq org-agenda-files (list "E:/��������ѧϰ���о�/ѧϰ�ʼ�/org"))
;;(setq org-agenda-files (list "D:/agenda"))
;;��� D:/agenda Ŀ¼�£���������Ŀ¼��������org�ļ������뵽�ճ̱��������Χ��Ҳ����ʹ������Ŀ�ݼ������ӻ�ɾ����
;;    C-c [ ���ѵ�ǰ�ļ��ӵ� agenda-files �б����ǰ�棻����ļ��Ѿ��� agenda-files �У��Ͱ��Ƶ����б���ǰ�������档
;;    C-c ] ���ѵ�ǰ�ļ��� agenda-files �б��Ƴ�


;;---δ����
;;    ��init.el�����ļ�������ĳ���ļ��ı༭ģʽΪorg����txt���ļ���
;;(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))




;;--------------------������------------------

;;��gcc���뻷�����뵽PATH��
;;�ҵ�win7ϵͳ����emacs���������⣬����˵emacs���Զ���PATH·�����ļ����뵽�Լ���path�У�����û�У�������ֻ���ֶ���ϵͳ����������path���ƹ����ˡ�
;;��Ҫ�����ⲿ����һЩ�����е������򵥵���gcc�ı���c���Ե�����
;;�Ժ��������ϵͳ�������������Ҫ����ɾ�����ˡ�
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


;;�Զ���ȫ����
(add-to-list 'load-path "/path/to/company")
(autoload 'company-mode "company" nil t)
