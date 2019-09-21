;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp/mm-mode-0.4.8") load-path))
;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp/git-emacs") load-path))
;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp") load-path))

(when (> emacs-major-version 23)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
(setq emacs-configuration-file-directory "~/.emacs.d/config")
(load (format "%s/%s" emacs-configuration-file-directory "functions.el"))
;;; (load (format "%s/%s" emacs-configuration-file-directory "grep.el"))
(load (format "%s/%s" emacs-configuration-file-directory "editor.el"))
(load (format "%s/%s" emacs-configuration-file-directory "extension_mode_mapper.el"))
(load (format "%s/%s" emacs-configuration-file-directory "ido_mode.el"))
(load (format "%s/%s" emacs-configuration-file-directory "keyboard_bindings.el"))
(load (format "%s/%s" emacs-configuration-file-directory "tramp.el"))
(load (format "%s/%s" emacs-configuration-file-directory "lint-fix-on-save.el"))
(load (format "%s/%s" emacs-configuration-file-directory "ruby.el"))
(load (format "%s/%s" emacs-configuration-file-directory "typescript.el"))
(load (format "%s/%s" emacs-configuration-file-directory "custom.el"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)


;; ;; `customize` settings
;; (setq custom-file (file-truename "./config/custom.el"))
;; (load custom-file)

;; (defadvice web-mode-highlight-part (around tweak-jsx activate)
;;   (if (equal web-mode-content-type "jsx")
;;       (let ((web-mode-enable-part-face nil))
;;         ad-do-it)
;;     ad-do-it))


(set-frame-size-according-to-resolution)

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (projectile-mode)
            ))
