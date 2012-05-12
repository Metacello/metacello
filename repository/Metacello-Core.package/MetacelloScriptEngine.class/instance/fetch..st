actions api
fetch: required
    [ 
    ^ self
        root:
            (required isEmpty
                ifTrue: [ self version fetch ]
                ifFalse: [ self version fetch: required ]) ]
        on: MetacelloLookupConfigurationPackageSpecNotification
        do: [ :ex | ex resume: ((self lookupConfigurationPackageSpecFrom: ex packageSpec) ifNil: [ ^ ex resume: ex packageSpec ]) ]