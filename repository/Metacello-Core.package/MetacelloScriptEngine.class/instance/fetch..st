actions api
fetch: required
    [ self root: ((self projectClass versionFrom: self) fetch: required) ]
        on: MetacelloLookupConfigurationPackageSpecNotification
        do: [ :ex | ex resume: ((self lookupConfigurationPackageSpecFrom: ex packageSpec) ifNil: [ ^ ex resume: ex packageSpec ]) ]