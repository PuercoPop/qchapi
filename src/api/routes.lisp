(in-package :qchapi)
(defvar *app* (make-instance 'ningle:<app>))

;; Strategy,
;; 1. look for word:
;; 2. If it doesn't exist create it.
;; 3. If there are definitions, look for definitions on that word.
;; 4. If there are examples for the definition then add thoe
(setf (ningle:route *app* "/word/" :method :PUT)
      #'(lambda (params)
          (let* ((json (getf (getf (clack.request:env ningle:*request*) :body-parameters) :json))
                 (word-name (gethash "name" json))
                 (word-definitions (gethash "definitions" json)))
            (unless (postmodern:query (:select 'word.name :from word))
              (query  (:insert-into 'word :set 'name word-name)))
            )))

;; (setf (ningle:route *app* "/word/" :method :PUT)
;;       #'(lambda (params)
;;           (format nil "Content-type: ~a~&###~&Raw Body: \~a~&###~&Env: ~a"
;;                   (clack.request:content-type ningle:*request*)
;;                   (clack.request:raw-body ningle:*request*)
;;                   (clack.request:env ningle:*request*))))

(setf (ningle:route *app* "/words/" :method :GET)
      #'(lambda (params)
          (format nil "~a" (slot-value ningle:*request* 'clack.request::env))))
