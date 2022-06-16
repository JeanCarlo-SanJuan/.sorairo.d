;; Functions  that mimic some vscode behavior

(defun cut-entire-line ()
  "Cuts the line where i-cursor is without having to move to its start. Similar to cutting in vs-code."
  (interactive)
  (beginning-of-line)
  (kill-line)
    (append-next-kill)
   (kill-line)
  )

(defun copy-entire-line ()
  "Copy  the line where i-cursor is without having to move to its start. Similar to copying  in vs-code."
  (interactive)
      (beginning-of-line)
      (set-mark-command nil)
      (end-of-line)
      (kill-ring-save nil nil t)
      (kill-append  "\n" t)
)

;;Normal expected behavior for  C-backspace
(defun normalCBackspace ()
  (interactive)
  (if (bolp)  ; beginnning of line, just delete 1
      (backward-delete-char 1)
    (if (string-match "[^[:space:]]" (buffer-substring (point-at-bol) (point)))
        ; There's a word on the line, delete it
        (backward-kill-word 1)
      (delete-region (point-at-bol) (point))))) ; all whitespace, delete it

(provide 'vscode-funcs)
