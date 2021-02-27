(setq-default python-black-on-save-mode t)

(setq flycheck-flake8rc "~/.flake8")
(add-hook 'python-mode-hook 'flycheck-mode)

(setq blacken-line-length 120)
