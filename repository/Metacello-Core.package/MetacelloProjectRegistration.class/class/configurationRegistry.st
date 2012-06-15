accessing
configurationRegistry
    ConfigurationRegistry ifNil: [ ConfigurationRegistry := Dictionary new ].
    ^ ConfigurationRegistry