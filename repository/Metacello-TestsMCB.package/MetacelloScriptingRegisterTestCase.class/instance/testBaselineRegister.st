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
      Transcript
        cr;
        show: 'testBaselineRegister error: ' , ex description.
      ex pass ]