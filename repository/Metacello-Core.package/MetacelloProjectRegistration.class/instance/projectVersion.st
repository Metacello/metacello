accessing
projectVersion
  self versionInfo projectVersion
    ifNil: [ self versionInfo projectVersion: self projectSpec versionOrNil ].
  ^ self versionInfo projectVersion