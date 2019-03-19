(require 'package)

(defvar conf-dir "/Users/yiannis/.emacs.d/conf/")

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar namooh/required-packages '(better-defaults))

(dolist (p namooh/required-packages)
  (when (not (package-installed-p 'better-defaults))
    (package-install 'better-defaults)))

(load-file (concat conf-dir "ace-jump-conf.el"))
(load-file (concat conf-dir "fiplr-conf.el"))
(load-file (concat conf-dir "util-fns.el"))
(load-file (concat conf-dir "auto-complete-conf.el"))
(load-file (concat conf-dir "browse-kill-ring-conf.el"))
(load-file (concat conf-dir "color-theme-conf.el"))
(load-file (concat conf-dir "cider-conf.el"))
(load-file (concat conf-dir "clojure-conf.el"))
(load-file (concat conf-dir "ido-conf.el"))
(load-file (concat conf-dir "lisp-conf.el"))
(load-file (concat conf-dir "paredit-conf.el"))
(load-file (concat conf-dir "popwin-conf.el"))
(load-file (concat conf-dir "recentf-conf.el"))
(load-file (concat conf-dir "smex-conf.el"))
(load-file (concat conf-dir "backup-dir-conf.el"))
(load-file (concat conf-dir "ahs-conf.el"))
(load-file (concat conf-dir "rainbow-conf.el"))
(load-file (concat conf-dir "neotree-conf.el"))
(load-file (concat conf-dir "php-conf.el"))
(load-file (concat conf-dir "mc-conf.el"))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c n e b") 'cider-eval-buffer)

;; comment region
(global-set-key (kbd "M-/") 'comment-or-uncomment-region)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string (regexp-quote isearch-string))))))

(global-linum-mode t)
(setq linum-format "%d ")
;;(setq linum-format "%4d \u2502 ")

;; Use pandoc to render markdown file previews
(setq markdown-command "/usr/local/bin/pandoc")

;; To not clutter up the file tree with Emacs’ backup files, save them to a dedicated directory:
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; no lock files
(setq create-lockfiles nil)

(global-set-key (kbd  "C-x x") 'rgrep)

(defun switch-to-most-recent-buffer ()
      (interactive)
      (switch-to-buffer (other-buffer (current-buffer) 1)))
(global-set-key (kbd  "C-M-<return>") 'switch-to-most-recent-buffer)
(global-set-key (kbd  "C-M-<backspace>") 'revert-buffer)
(global-set-key (kbd  "C-S-a") 'mark-whole-buffer)

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root. With a prefix ARG prompt
for a file to visit. Will also prompt for a file to visit if
current buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun insert-pprint ()
  (interactive)
  (insert "clojure.pprint/pprint")
  (live-delete-whitespace-except-one))

(global-set-key (kbd "C-c s p") 'insert-pprint)

;; show keystrokes in mini-buffer instantly
(setq echo-keystrokes 0.01)

(require 'undo-tree)
(global-undo-tree-mode)

(defalias 'yes-or-no-p 'y-or-n-p)

;; removes scrollbar
(scroll-bar-mode -1)

;; switch between windows
(global-set-key (kbd "C-c n") 'next-multiframe-window)
(global-set-key (kbd "C-x n") 'other-frame)

(show-paren-mode 1)

(eval-after-load 'clojure-mode
   '(sayid-setup-package))

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
;; (setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
;; This gives you a tab of 2 spaces for coffee files
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(package-selected-packages
   (quote
    (markdown-mode markdown-mode+ markdown-preview-mode vue-mode elpy yaml-mode undo-tree terraform-mode smex sayid recentf-ext rainbow-mode rainbow-delimiters popwin php-mode paredit neotree multiple-cursors idomenu flx-ido fiplr elisp-slime-nav color-theme coffee-mode browse-kill-ring better-defaults auto-highlight-symbol align-cljlet ace-jump-mode ac-cider))))

;; 2 spaces indentation for scss/css files 
(setq css-indent-offset 2)

;; 2 spaces indentation for js files 
(setq js-indent-level 2)

;; use spaces instead of tabs when indenting
(setq-default indent-tabs-mode nil)

(message "\n\n init.el done loading  \n\n")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))))
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black")))))
