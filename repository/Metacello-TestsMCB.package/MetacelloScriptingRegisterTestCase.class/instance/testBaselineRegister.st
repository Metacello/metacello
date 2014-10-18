tests
testBaselineRegister
  [ 
  | projectSpec |
  Metacello new
    baseline: 'Sample';
    repository: 'github://dalehenrich/sample:master/repository';
    register.
  projectSpec := (Metacello registry
    baseline: 'Sample';
    list) first.
  self
    assert:
      projectSpec repositoryDescriptions asArray
        = {'github://dalehenrich/sample:master/repository'} ]
    on: Error
    do: [ :ex | 
      "see https://github.com/dalehenrich/metacello-work/issues/303"
      (MetacelloPlatform current
        string: ex description
        includesSubstring: 'SSL error, code: -5')
        ifFalse: [ ex pass ] ]