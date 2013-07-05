(in-package :qchapi.models)

(defclass word ()
  ((name :col-type string :initarg :name :accessor word-name))
  (:keys name)
  (:metaclass dao-class))

(defclass definition ()
  ((id :col-type serial :reader definition-id)
   (content :col-type string :initarg :content :accessor definition-content)
   (word :col-type string :initarg :word :accessor definition-word))
  (:metaclass dao-class)
  (:keys id))

(defclass example ()
  ((id :col-type serial :initarg :id :accessor example-id)
   (content :col-type string :initarg :content :accessor example-content)
   (definition-id :col-type integer :initarg :definition
                  :accessor example-definition))
  (:metaclass dao-class)
  (:keys id))

(deftable word (!dao-def))

(deftable definition
  (!dao-def)
  (!foreign 'word 'word :primary-key))

(deftable example
  (!dao-def)
  (!foreign 'definition 'definition-id :primary-key))

(defmethod print-object ((obj word) stream)
  "In order to help checking the results"
  (print-unreadable-object (obj stream :type t :identity t)
    (format stream "name: ~A" (word-name obj))))

(defmethod print-object ((obj definition) stream)
  "In order to help checking the results"
  (print-unreadable-object (obj stream :type t :identity t)
    (format stream "of the word: ~A. Content: ~A" (definition-word obj) (definition-content obj))))

(defmethod print-object ((obj example) stream)
  "In order to help checking the results"
  (print-unreadable-object (obj stream :type t :identity t)
    (format stream "content: ~A" (example-content obj))))
