(tool-bar-mode -1) ;No toolbar
(tooltip-mode -1) ; No tooltips
(menu-bar-mode -1) ; No menubar

(use-package all-the-icons)
(use-package command-log-mode
  :commands command-log-mode
)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
 )

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package ivy
  :diminish
  :defer
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
	:init(ivy-mode)
)

(use-package which-key
  :defer
  :diminish which-key-mode
  :init(which-key-mode)
    :config
     (setq which-key-idle-delay 0.5)
)

(use-package ivy-rich
  :after ivy
  :config
  (ivy-rich-mode 1)
)

(use-package counsel
  :demand t
  :defer
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-M-j" . counsel-switch-buffer)
         ("C-M-l" . counsel-imenu)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

(global-set-key [C-tab] 'counsel-switch-buffer)

(provide 'ss-ui)
