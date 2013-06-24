(defpackage #:qchapi.models
  (:use #:cl #:pomo)
  (:export #:*db*
           #:word
           #:definition
           #:example))

(defpackage #:qchapi
  (:use #:cl)
  (:import-from :ningle :*response*)
  (:import-from :postmodern #:query)
  (:import-from :qchapi.models #:*db*
                               #:word
                               #:definition
                               #:example))




;; (:import-from :postmodern #:deftable
;;                           #:!dao-def
;;                           #:dao-class
;;                           #:!foreign
;;                           #:insert-dao
;;                           #:get-dao
;;                           #:deftable
;;                           #:!dao-def
;;                           #:!foreign
;;                           #:table-exists-p
;;                           #:dao-table-definition)
