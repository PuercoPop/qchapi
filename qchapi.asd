;;;; qchapi.asd

(asdf:defsystem #:qchapi
  :name "qchapi"
  :description "A Restful Api for Qcha.es"
  :author "Javier Olaechea <pirata@gmail.com>"
  :version "20130401"
  :serial t
  :license "<3"
  :depends-on (#:clack
               #:ningle
               #:yason
               #:postmodern)

  :pathname "src/"
  :components ((:file "packages")
               (:module "models"
                :serial t
                :components
                ((:file "conf")
                 (:file "utils")
                 (:file "data-structures")
                 (:file "tables")
                 (:file "queries")))
               (:module "api"
                :serial t
                :components
                ((:file "endpoints")
                 (:file "routes")))
               (:file "qchapi")))
