;; Bindings that implement the usual behavior of other editors
(require 'vscode-funcs)

(setq tab-width 4)
(setq indent-line-function 'insert-tab)

;;Commands here
(global-set-key [escape]  'keyboard-escape-quit) 
(global-set-key [C-a]  'mark-whole-buffer)
(global-set-key [C-s]  'save-buffer)
(global-set-key [C-q]  'beginning-of-line)
(global-set-key [C-z] 'undo) ;; The default undo is untouched
	
;;vscode related
(global-set-key (kbd "C-`") 'eshell)
(global-set-key [C-backspace] 'normalCBackspace)
(global-set-key [C-x x] 'cut-entire-line)
(global-set-key [C-c c]  'copy-entire-line)
				
(provide 'ss-edit)
