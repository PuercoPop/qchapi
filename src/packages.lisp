;;;; package.lisp
(defpackage #:qchapi
  (:use #:cl))

(defpackage #:qchapi.models
  (:use #:cl)
  (:import-from :postmodern #:deftable
                            #:!dao-def
                            #:dao-class
                            #:!foreign
                            #:insert-dao
                            #:get-dao)
  (:export #:word
           #:definition
           #:example))

(defpackage #:qchapi.db
  (:use #:cl)
  (:import-from :qchapi.models #:word
                               #:definition
                               #:example)

  (:import-from :postmodern #:deftable
                            #:!dao-def
                            #:!foreign))
