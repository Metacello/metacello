accessing
ensureList
    ensureList ifNil: [ ensureList := OrderedCollection with: #'MetacelloScriptEngine' -> 'batch' ].
    ^ ensureList