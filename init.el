(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Temporarily reduce gc runs. The default is 800 kbs.
(setq gc-cons-threshold (* 70 1000 1000))

;; Initialize use-package for non-linux
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-verbose t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-buffer-encoding 'nondefault)
 '(doom-modeline-buffer-name nil)
 '(package-selected-packages
   '(magit dap-mode company-ctags treemacs-projectile treemacs-all-the-icons yasnippet js2-mode projectile counsel ivy-rich rainbow-mode all-the-icons doom-modeline rainbow-delimiters vue-mode swiper which-key ivy command-log-mode lsp-ui rustic treemacs sass-mode emmet-mode web-mode company lsp-mode ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "SystemWindow" :foreground "SystemWindowText" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 151 :width normal :foundry "outline" :family "Monospace"))))
 '(doom-modeline-bar-inactive ((t (:background "black" :foreground "#5cc3cb"))))
 '(doom-modeline-inactive ((t (:inherit doom-modeline-bar-inactive))))
 '(font-lock-type-face ((t (:foreground "#05472A"))))
 '(scroll-bar ((t (:foreground "#f5deb3" :width condensed))))
 '(success ((t (:foreground "#006400" :weight bold)))))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                   (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(require 'ss-defaults)
(require 'ss-ui)
(require 'ss-edit)
(require 'ss-projects)
(require 'ss-ide)

(defun open-init-file ()
  (interactive) (find-file user-init-file))

(defun try-init-file () (interactive) (open-init-file) (eval-buffer) (message "reloading init file"))
;;multi-commands
(global-set-key [f7] 'open-init-file)
(global-set-key [C-f7] 'try-init-file)
;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
