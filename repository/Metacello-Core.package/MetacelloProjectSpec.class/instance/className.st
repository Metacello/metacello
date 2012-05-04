querying
className
    className ifNil: [ self name ifNotNil: [ className := 'ConfigurationOf' , self name ] ].
    ^ className