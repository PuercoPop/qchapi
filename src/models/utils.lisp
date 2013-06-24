(in-package :qchapi.models)

(defmacro ensure-table (table-name)
  `(unless (table-exists-p ,table-name)
     (execute (dao-table-definition ,table-name))))
