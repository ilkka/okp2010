(defun mydifference (a b)
  (cond
    ((endp b) a)
    ((null (find (car b) a)) (mydifference a (cdr b)))
    (t (remove (car b) a))))
