accessing
currentBranchName
  ^ self configurationProjectSpec
    ifNotNil: [ configurationProjectSpec version blessing asString ]
    ifNil: [ baselineProjectSpec repositoryBranchName ]