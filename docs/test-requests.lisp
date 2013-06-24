(defpackage #:qchapi.tests
  (:use #:cl)
  (:import #:drakma))

(in-package #:qchapi.tests)

(setf drakma:*header-stream* *standard-output*)
(drakma:http-request "http://localhost:5000/word/"
                     :method :put
                     :content-type "application/json"
                     :content "{\"name\": \"Piticlin\", \"definitions\": [ { \"content\": \"Persona excesivamente pusilánime.\", \"examples\": [ { \"content\": \"Justin Beiber es un pitíclin\" } ] } ] }")
