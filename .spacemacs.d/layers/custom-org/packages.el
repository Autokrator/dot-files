(setq custom-org-packages '(org))

(defun custom-org/post-init-org ()
  (setq-default
   org-tags-column -80
   org-startup-indented t
   org-startup-align-all-tables t
   org-export-backends '(html latex md)
   org-footnote-auto-adjust t
   org-footnote-auto-label 'confirm
   org-agenda-restore-windows-after-quit t
   org-agenda-window-setup 'other-window
   org-directory "~/org"
   org-default-notes-file "~/org/capture.org"
   org-agenda-files '("~/org/agenda.org")
   org-catch-invisible-edits 'show-and-error
   org-list-allow-alphabetical t
   org-todo-keywords
   '((sequence "TODO" "|" "DONE(d)")
     (sequence "BUY" "|" "BOUGHT(d)"))
   org-capture-templates
   '(("t" "Tasks related templates")
     ("tw" "Work Tasks" entry (file+headline "tasks/work.org" "Tasks")
     "* TODO %?\n [[%l][%i...]]")
     ("tp" "Personal Tasks" entry (file+headline "tasks/personal.org" "Tasks")
      "* TODO %?\n [[%l][%i...]]")
     ("j" "Journal related templates")
     ("ji" "Journal Idea" item (file+headline "journal.org" "Ideas") "- %?")
     ("jt" "Journal Thought" item (file+headline "journal.org" "Thoughts") "- %?")
     ("g" "Grocery List" entry (file+headline "groceries.org" "Grocery") "* BUY %?")))
  (with-eval-after-load 'org
    (custom/add-org-link-type "bbg")))
