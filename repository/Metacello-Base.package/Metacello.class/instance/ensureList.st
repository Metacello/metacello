accessing
ensureList
    ensureList ifNil: [ ensureList := OrderedCollection with: #'MetacelloScriptExecutor' -> 'batch' ].
    ^ ensureList