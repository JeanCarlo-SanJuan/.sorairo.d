(add-hook 'after-init-hook 'electric-pair-mode) ;Auto adds char pairs like ()
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'completion-at-point)
(add-hook 'after-init-hook 'global-display-line-numbers-mode)
(set-face-attribute 'default nil :font "consolas" :height 140)
(setq default-directory "E:/Code/")

;; Disable line numbers for some modes
(with-eval-after-load
    (dolist (mode '(org-mode-hook
		    term-mode-hook
		    eshell-mode-hook))
      (add-hook mode( lambda () (display-line-numbers-mode 0))))
)

(provide 'ss-defaults)
