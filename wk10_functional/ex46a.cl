(defun deltop (s l)
  (cond
    ((listp l)
     (cond
       ((endp l) '())
       ((eq s (car l)) (deltop s (cdr l)))
       (t (cons (car l) (deltop s (cdr l))))))
    (t '(l))))

