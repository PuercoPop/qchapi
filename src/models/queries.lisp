(in-package :qchapi.models)


(defun test () 
  (pomo:insert-dao (make-instance 'definition
                                  :content "es un piticlin"
                                  :word "bobo")))


