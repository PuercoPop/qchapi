(in-package :qchapi.models)

(deftable word (!dao-def))

(deftable definition
    (!dao-def)
    (!foreign 'word 'word :primary-key))

(deftable example
    (!dao-def)
    (!foreign 'definition 'id :primary-key))

;; The reverse is important
(defun drop-tables ()
  (with-connection *db*
    (let ((tables  (reverse (pomo:list-tables))))
      (dolist (table tables)
        (query (:drop-table table))))))

(defun create-tables ()
  (with-connection *db*
    (ensure-table 'definition)
    (ensure-table 'word)
    (ensure-table 'example)))
    ;; (ensure-table 'users)

(defun reset-db ()
  (drop-tables)
  (create-tables))

(create-tables)

(with-connection *db*
  (pomo:list-tables))
