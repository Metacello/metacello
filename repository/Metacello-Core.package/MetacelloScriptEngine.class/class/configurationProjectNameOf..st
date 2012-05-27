utility
configurationProjectNameOf: configurationClassName
    ^ (configurationClassName indexOfSubCollection: 'ConfigurationOf') = 0
        ifTrue: [ configurationClassName ]
        ifFalse: [ configurationClassName copyFrom: 'ConfigurationOf' size + 1 to: configurationClassName size ]