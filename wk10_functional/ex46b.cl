(defun delrec (s l)
  (cond
    ((listp l)
     (cond
       ((endp l) '())
       ((eq s (car l)) (delrec s (cdr l)))
       ((listp (car l)) (cons (delrec s (car l)) (delrec s (cdr l))))
       (t (cons (car l) (delrec s (cdr l))))))
     (t '(l))))
