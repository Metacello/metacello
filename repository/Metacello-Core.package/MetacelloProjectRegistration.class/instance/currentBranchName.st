accessing
currentBranchName
  ^ self configurationProjectSpec
    ifNotNil: [ 
      | projectVersion |
      projectVersion := self versionInfo projectVersion.
      projectVersion
        ifNil: [ self versionInfo projectVersion: configurationProjectSpec versionOrNil ].
      projectVersion ifNil: [ ^ '' ].
      ^ projectVersion blessing asString ]
    ifNil: [ baselineProjectSpec repositoryBranchName ]