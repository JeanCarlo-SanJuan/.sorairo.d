;; Bindings that implement the usual behavior of other editors
(require 'vscode-funcs)

;;Commands here
(global-set-key (kbd "<escape>")  'keyboard-escape-quit) 
(global-set-key (kbd "C-a")  'mark-whole-buffer)
(global-set-key (kbd "C-s")  'save-buffer)
(global-set-key (kbd "C-q")  'beginning-of-line)
(global-set-key (kbd "C-`") 'eshell)

;;vscode  related
(global-set-key [C-backspace] 'normalCBackspace)
(global-set-key (kbd "C-x x")  'cut-entire-line)
(global-set-key (kbd "C-c c")  'copy-entire-line)

(provide 'ss-edit)
