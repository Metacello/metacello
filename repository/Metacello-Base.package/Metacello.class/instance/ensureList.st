accessing
ensureList
    ensureList ifNil: [ ensureList := OrderedCollection with: #'MetacelloScriptEngine' -> 'bootstrap' ].
    ^ ensureList