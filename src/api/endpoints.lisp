(in-package :qchapi)

(defun list-words ()
  "It returns the list of all the words saved in the database."
  (with-connection *db*
  (pomo:select-dao 'word)))

(defun create-definition (word definition &optional example)
  "If the word is not on the database, create the word. Either way insert the
   definition and optionally the example."
  (ensure-dao 'word word)
  (let ((definition-id (get-or-create-definition definition)))
    (when example
      (get-or-create-example example definition-id))))


(defun detail-word (word)
  "Return a detailed representation of a word, including all the definition
and examples of them.")

(defun detail-definition (definition-id)
  "Return the word being defined, definition's text and the examples for the definition in question.")

(defun detail-example (example-id)
  "Return the text of the example, alongside the word and the definition of the example in question.")
