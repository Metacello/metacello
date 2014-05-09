accessing
currentBranchName
  ^ self configurationProjectSpec
    ifNotNilDo: [ :aSpec | '' ]
    ifNil: [ baselineProjectSpec repositoryBranchName ]