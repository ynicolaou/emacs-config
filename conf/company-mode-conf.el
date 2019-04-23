(require 'cider)
(require 'cider-repl)
(require 'cider-mode)
(require 'company)
(require 'company-quickhelp)


(add-hook 'after-init-hook 'global-company-mode)
(company-quickhelp-mode)
(setq company-quickhelp-delay 1)

(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
