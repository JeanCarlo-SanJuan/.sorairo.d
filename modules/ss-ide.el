;; Contains config for the LSPs

(use-package lsp-mode
  ;; add this to defer loading of lsp until lsp or lsp-deferred is called
  :commands (lsp lsp-deferred)
)

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
	      ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
	      ("<tab>" . company-indent-or-complete-common))
)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
)

(use-package dap-mode
  :commands (dap dap-deferred)
)

(use-package yasnippet
  :ensure
  :defer
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode)
)

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common))
)

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
	(backward-char 1)
	(if (looking-at "::") t nil))))
)

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand))
)

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
	    (null (do-yas-expand)))
	(if (check-expansion)
	    (company-complete-common)
	  (indent-for-tab-command))))
)

(use-package js2-mode
  :mode "\\.js\\'"
  :config
  (add-hook 'js2-mode-hook #'lsp-deferred)
)

(use-package vue-mode
  :mode "\\.vue\\'"
  :config
  (add-hook 'vue-mode #'lsp-deferred)
)

(use-package rustic
  :mode ("\\.rs\\'" . rustic-mode)
  :config
  (setq
   rustic-lsp-server 'rust-analyzer
   rustic-analyzer-command '("rust-analyzer")
   rustic-enable-detached-file-support t
   lsp-auto-guess-root t
  )
)

(with-eval-after-load 'company
  (company-ctags-auto-setup)
)

(provide 'ss-ide)
