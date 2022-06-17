;; For organizing projects/workspaces

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :defer
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "e:/Code")
    (setq projectile-project-search-path '(("e:/Code" . 2) "d:/code")))
  (setq projectile-switch-project-action #'projectile-dired)
  :defer
  )

(global-set-key [C-tab] 'counsel-switch-buffer)

(use-package treemacs
  :defer
 :bind(
("C-c b" . treemacs)
))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :config(treemacs-project-follow-mode)
 )

(provide 'ss-projects)
