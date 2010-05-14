(defun myunion (a b)
  (cond
    ((endp b) a)
    ((null (find (car b) a)) (myunion (append a (list (car b))) (cdr b)))
    (t (myunion a (cdr b)))))

