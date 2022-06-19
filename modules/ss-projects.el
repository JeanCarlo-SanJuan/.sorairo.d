;; For organizing projects/workspaces

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  
  :init
  (when (file-directory-p "e:/Code")
    (setq projectile-project-search-path '(("e:/Code" . 2) "d:/code")))
  (setq projectile-switch-project-action #'projectile-dired)
)

(use-package treemacs
 :after(projectile)
 :bind(
    ("C-c b" . treemacs)
 )
)

(use-package treemacs-projectile
  :after ('treemacs 'projectile)
  :config(treemacs-project-follow-mode)
)

(add-hook 'after-init-hook 'projectile-mode)

(use-package magit
  :defer
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(add-hook 'server-after-make-frame-hook 'desktop-save-mode 'desktop-read)

(provide 'ss-projects)
