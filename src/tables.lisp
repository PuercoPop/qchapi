(in-package :qchapi.db)

(deftable word (!dao-def))

(deftable definition
    (!dao-def)
    (!foreign 'word 'word :primary-key))

(deftable example
    (!dao-def)
    (!foreign 'definition 'id :primary-key))

(postmodern:create-table 'word)
(postmodern:create-table 'definition)
(postmodern:create-table 'example)
