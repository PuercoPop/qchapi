(in-package :qchapi.models)

(defmacro ensure-table (table-name)
  `(unless (pomo:table-exists-p ,table-name)
     (pomo:create-table ',table-name)))

(defmacro ensure-dao (dao-instance)
  `(unless (pomo:dao-exists-p ,dao-instance)
     (pomo:insert-dao ,dao-instance)))
