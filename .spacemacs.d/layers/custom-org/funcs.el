(defun custom/add-org-link-type (type)
  (org-add-link-type
   type
   nil
   (lexical-let
       ((type
         type))
     #'(lambda (path desc format)
         (cond ((eq format 'latex)
                (format "\\href{%s:%s}{%s}" type path desc))
               ((eq format 'md)
                (format "[%s](%s:%s)" type desc path))
               ((eq format 'html)
                (format "<a href=\"%s:%s\">%s</a>" type path desc)))))))
