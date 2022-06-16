(tool-bar-mode -1) ;No toolbar
(tooltip-mode -1) ; No tooltips
(menu-bar-mode -1) ; No menubar

(use-package  all-the-icons)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
 )

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind (("C-f" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-f" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1))


(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.5))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :demand t
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-M-j" . counsel-switch-buffer)
         ("C-M-l" . counsel-imenu)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

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

(global-set-key [C-tab] 'counsel-switch-buffer)

(provide 'ss-ui)
