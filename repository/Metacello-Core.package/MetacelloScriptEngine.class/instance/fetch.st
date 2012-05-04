actions api
fetch
    [ self root: (self projectClass versionFrom: self) fetch ]
        on: MetacelloLookupConfigurationPackageSpecNotification
        do: [ :ex | ex resume: ((self lookupConfigurationPackageSpecFrom: ex packageSpec) ifNil: [ ^ ex resume: ex packageSpec ]) ]