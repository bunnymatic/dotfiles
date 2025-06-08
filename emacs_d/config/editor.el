(setq-default indent-tabs-mode nil)
(setq-default scss-compile-at-save nil)
(setq-default show-trailing-whitespace t)

(setq-default c-basic-offset 2)
(setq-default coffee-tab-width 2)
(setq-default css-indent-offset 2)
(setq-default indent-tabs-mode nil)
(setq-default javascript-indent-level 2)
(setq-default js-indent-level 2)
(setq-default jsx-indent-level 2)
(setq-default python-tab-width 4)
(setq-default python-indent-offset 4)
(setq-default scss-compile-at-save nil)
(setq-default show-trailing-whitespace t)
(setq-default tab-width 2)
(setq-default typescript-indent-level 2)
(setq-default web-mode-code-indent-offset 2)
(setq-default web-mode-css-indent-offset 2)
(setq-default web-mode-markup-indent-offset 2)

(load-theme 'tsdh-dark)
(enable-theme 'tsdh-dark)

;;(load-theme 'solarized-dark t)
;;(global-linum-mode)

; auto revert files
(global-auto-revert-mode t)

;; Disable tool-bar
(tool-bar-mode -1)

;; Disable Menu Bar
(menu-bar-mode -1)

(add-hook 'before-save-hook 'whitespace-cleanup)

(put 'downcase-region 'disabled nil)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "cornsilk" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Monaco")))))
