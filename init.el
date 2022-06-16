(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Initialize use-package for non-linux
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-buffer-encoding 'nondefault)
 '(doom-modeline-buffer-name nil)
 '(package-selected-packages
   '(treemacs-projectile treemacs-all-the-icons yasnippet js2-mode projectile counsel ivy-rich rainbow-mode all-the-icons doom-modeline rainbow-delimiters vue-mode swiper which-key ivy command-log-mode lsp-ui rustic treemacs sass-mode emmet-mode web-mode company lsp-mode ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.)
 '(scroll-bar ((t (:foreground "#f5deb3" :width condensed)))))

(require 'ss-defaults)
(require 'ss-ui)
(require 'ss-edit)

(defun open-init-file ()
  (interactive) (find-file user-init-file))

;;multi-commands
(global-set-key [f7] 'open-init-file)

(use-package lsp-mode
  ;; add this to defer loading of lsp until lsp or lsp-deferred is called
  :hook(js2-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

(add-hook 'js2-mode-hook #'lsp-deferred)
(add-hook 'js-mode-hook #'lsp-deferred)

(use-package vue-mode
  :mode "\\.vue\\'"
  :config
  (add-hook 'vue-mode-hook #'lsp-deferred))
