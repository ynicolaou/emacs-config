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

(global-set-key (kbd "C-x C-b") 'ibuffer)
