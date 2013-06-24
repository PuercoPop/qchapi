(in-package :qchapi.models)

;; TODO, figure out a way to compute the order.
(defun drop-tables ()
  (with-connection *db*
    (let ((tables  (reverse (pomo:list-tables))))
      (dolist (table tables)
        (query (:drop-table table))))))

(defun create-tables ()
  (with-connection *db*
    (ensure-table 'word)
    (ensure-table 'definition)
    (ensure-table 'example)))
    ;; (ensure-table 'users)

(defun reset-db ()
  (drop-tables)
  (create-tables))
