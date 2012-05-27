actions api
fetch: required
    [ 
    ^ self
        root:
            (required isEmpty
                ifTrue: [ self version fetch ]
                ifFalse: [ self version fetch: required ]) ]
        on: MetacelloLookupConfigurationProjectSpecNotification
        do: [ :ex | ex resume: ((self lookupConfigurationProjectSpecFrom: ex projectSpec) ifNil: [ ^ ex resume: ex projectSpec ]) ]