(defpackage :qchapi.models
  (:use :cl :pomo)
  (:export :*db*
           :word
           :definition
           :example))

(defpackage :qchapi
  (:use :cl)
  (:import-from :ningle :*response*)
  (:import-from :postmodern :query)
  (:import-from :qchapi.models :*db*
                               :word
                               :definition
                               :example))
