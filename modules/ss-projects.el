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
  :defer
  )

(use-package treemacs
  :defer
 :bind(
("C-c b" . treemacs)
))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :config(treemacs-project-follow-mode)
 )

(with-eval-after-load 'projectile)

(provide 'ss-projects)
