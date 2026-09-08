;;; backup-dir-conf.el --- backup and autosave directory  -*- lexical-binding: t; -*-

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
