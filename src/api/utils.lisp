(in-package :qchapi)

;; bobo
;; un piticlin
;; Pele es un piticlin

(defun ensure-word (name)
  (let ((search-name (pomo:get-dao 'word name)))
    (if search-name
        search-name
        (query (:insert-into 'word :set 'name name)))))

(defun create-definition (word definition)
  ""
  (let ((word (ensure-word "name")))
    (pomo:make-dao 'definition :content definition 
                   :word (pomo:get-dao 'word word))))


(defun create-example (definition-id text)
  (with-connection *db*
    (query (:insert-into 'example :set 'content text 'definition-id definition-id))))
