querying
projectPackage
    projectPackage ifNil: [ projectPackage := self project packageSpec ].
    ^ projectPackage