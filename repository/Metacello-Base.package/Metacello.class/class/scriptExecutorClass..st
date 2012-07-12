private
scriptExecutorClass: loadList
    | list |
    list := OrderedCollection new.
    loadList do: [ :assoc | Smalltalk at: assoc key ifAbsent: [ list add: assoc value ] ].
    list notEmpty
        ifTrue: [ ConfigurationOf ensureMetacello: list ].
    ^ Smalltalk at: #'MetacelloScriptExecutor'