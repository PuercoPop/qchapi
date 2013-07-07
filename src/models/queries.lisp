(in-package :qchapi.models)

(defun get-or-create-word (word)
  (car (car (aif
                (pomo:query (:select 'name :from 'word
                                     :where (:= 'name word)))
                it
                (pomo:query (:insert-into 'word
                                          :set 'name word
                                          :returning 'name))))))

(defun get-or-create-definition (word definition-text)
  "Return the pk of the definition in question, create it if it doesn't exist."
  (get-or-create-word word)
  (car (car (aif
                (pomo:query (:select 'id :from 'definition
                                     :where (:and (:= 'word word)
                                                  (:= 'content definition-text))))
                it
              (pomo:query (:insert-into 'definition
                                        :set 'word word
                                        'content definition-text
                                        :returning 'id))))))

(defun get-or-create-example (example-text definition-id)
  "Return the pk of the example in question for the definition in question.")
