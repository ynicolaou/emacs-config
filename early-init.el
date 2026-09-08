;;; early-init.el --- Loaded before package activation  -*- lexical-binding: t; -*-

;; Emacs 31 warns about every .el file it loads that lacks a `lexical-binding'
;; cookie. The vendored third-party packages under elpa/ (their autoloads files
;; and cyberpunk-theme.el) predate that cookie and we do not edit them, so drop
;; the warning entirely. This has to happen here rather than in init.el because
;; package activation, which loads those autoloads files, runs before init.el.
(require 'warnings)
(add-to-list 'warning-suppress-log-types '(files missing-lexbind-cookie))
