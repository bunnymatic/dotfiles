;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp/mm-mode-0.4.8") load-path))
;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp/git-emacs") load-path))
;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp") load-path))

;; (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;        ("melpa" . "https://melpa.org/packages/")))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq emacs-configuration-file-directory "~/.emacs.d/config")
(load (format "%s/%s" emacs-configuration-file-directory "functions.el"))
(load (format "%s/%s" emacs-configuration-file-directory "custom.el"))
;;; (load (format "%s/%s" emacs-configuration-file-directory "grep.el"))
(load (format "%s/%s" emacs-configuration-file-directory "editor.el"))
(load (format "%s/%s" emacs-configuration-file-directory "extension_mode_mapper.el"))
(load (format "%s/%s" emacs-configuration-file-directory "ido_mode.el"))
(load (format "%s/%s" emacs-configuration-file-directory "keyboard_bindings.el"))
(load (format "%s/%s" emacs-configuration-file-directory "tramp.el"))
(load (format "%s/%s" emacs-configuration-file-directory "lint-fix-on-save.el"))
(load (format "%s/%s" emacs-configuration-file-directory "ruby.el"))
(load (format "%s/%s" emacs-configuration-file-directory "python.el"))
(load (format "%s/%s" emacs-configuration-file-directory "typescript.el"))
(load (format "%s/%s" emacs-configuration-file-directory "projectile.el"))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2 t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "log" ".meteor" "dist" "node_modules" "*/node_modules" ".idea")))
 '(ido-enable-flex-matching t)
 '(ido-use-faces nil)
 '(inhibit-startup-screen t)
 '(javascript-indent-level 2 t)
 '(jsx-indent-level 2 t)
 '(package-selected-packages
   (quote
    (import-js nginx-mode typescript-mode flymake-json flymake-yaml yaml-mode rspec-mode color-theme-modern projectile projectile-codesearch projectile-direnv projectile-git-autofetch projectile-rails rjsx-mode emojify web-mode tramp-term sws-mode slim-mode scss-mode sass-mode ruby-tools ruby-compilation rubocop multiple-cursors magit jump jsx-mode json-mode js2-mode jade-mode icicles git-blame flycheck flx-ido feature-mode exec-path-from-shell color-theme-sanityinc-solarized coffee-mode base16-theme alchemist ag add-node-modules-path)))
 '(safe-local-variable-values (quote ((js2-basic-offset . 2))))
 '(standard-indent 2)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "cornsilk" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Monaco")))))
(put 'dired-find-alternate-file 'disabled nil)
