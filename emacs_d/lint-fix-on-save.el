(setq debug-on-error t)

(defun is-ruby-file (f)
  (if (string-match "\\.rb$" f)
      t
    nil
    ))

(defun is-javascript-file (f)
  (if (or
       (string-match "\\.jsx?$" f)
       (string-match "\\.json$" f))
      t
    nil
    ))

;;; runs eslint --fix on the current file after save
;;; alpha quality -- use at your own risk

(defun prettier-fix-file ()
  (interactive)
  (shell-command (concat "yarn prettier --write " (buffer-file-name))))

(defun prettier-fix-file-and-revert ()
  (interactive)
  (if (is-javascript-file (buffer-file-name))
      (funcall (lambda ()
                 (prettier-fix-file)
                 (revert-buffer t t)))))

(defun rubocop-fix-file ()
  (interactive)
  (shell-command (concat "bundle exec rubocop -a " (buffer-file-name) )))

(defun rubocop-fix-file-and-revert ()
  (interactive)
  (if (is-ruby-file (buffer-file-name))
      (funcall (lambda ()
                 (rubocop-fix-file)
                 (revert-buffer t t)))))

(add-hook 'after-save-hook #'rubocop-fix-file-and-revert)
(add-hook 'after-save-hook #'prettier-fix-file-and-revert)
