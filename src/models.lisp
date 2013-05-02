(in-package :qchapi.models)

(defclass word ()
  ((name :col-type string :initarg :name :accessor word-name))
     (:keys name)
     (:metaclass dao-class))

(defclass definition ()
  ((id :col-type integer :initarg id :accessor definition-id)
   (content :col-type string :initarg content :accessor definition-content)
   (word :col-type string :initarg word :accessor definition-word))
  (:metaclass dao-class)
  (:keys id))

(defclass example ()
  ((id :col-type integer :initarg id :accessor example-id)
   (content :col-type string :initarg content :accessor example-content)
   (definition-id :col-type integer :initarg definition
                  :accessor example-definition))
  (:metaclass dao-class)
  (:keys id))
