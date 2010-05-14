(defun myprod (a b)
  (cons (list (car a) (car b)) (cons (myprod (car a) (cdr b)) (myprod (cdr a) b))))
