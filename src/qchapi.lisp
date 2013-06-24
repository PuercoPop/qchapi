;;;; cl-qchapi.lisp

(in-package #:qchapi)

;;; "cl-qchapi" goes here. Hacks and glory await!
(defun start-qchapi ()
  (clack:clackup
   *app*))
