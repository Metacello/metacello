accessing
projectSpec
    projectSpec ifNil: [ self constructProjectSpec ].
    ^ projectSpec