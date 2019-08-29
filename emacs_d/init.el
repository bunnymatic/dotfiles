;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp/mm-mode-0.4.8") load-path))
;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp/git-emacs") load-path))
;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp") load-path))

;; added with package installer

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "log" ".meteor" "node_modules" "*/node_modules" ".idea")))
 '(ido-enable-flex-matching t)
 '(ido-use-faces nil)
 '(inhibit-startup-screen t)
 '(javascript-indent-level 2 t)
 '(jsx-indent-level 2 t)
 '(package-selected-packages
   (quote
    (flycheck-rust rust-mode tide rjsx-mode emojify web-mode tramp-term sws-mode slim-mode scss-mode sass-mode ruby-tools ruby-compilation rubocop projectile-git-autofetch projectile-direnv multiple-cursors magit jump jsx-mode json-mode js2-mode jade-mode icicles helm-projectile git-blame flycheck flx-ido feature-mode exec-path-from-shell color-theme-sanityinc-solarized color-theme coffee-mode base16-theme alchemist ag add-node-modules-path)))
 '(safe-local-variable-values (quote ((setq web-mode-markup-indent-offset 4))))
 '(standard-indent 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
