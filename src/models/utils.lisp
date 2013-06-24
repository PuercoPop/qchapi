(in-package :qchapi.models)

(defmacro ensure-table (table-name)
  `(unless (pomo:table-exists-p ,table-name)
     (pomo:create-table ',table-name)))
