accessing
projectSpec
    projectSpec ifNil: [ projectSpec := MetacelloMCProject new projectSpec ].
    ^ projectSpec