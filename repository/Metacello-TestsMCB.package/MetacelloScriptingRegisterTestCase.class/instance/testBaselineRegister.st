tests
testBaselineRegister
  | projectSpec |
  Metacello new
    baseline: 'Sample';
    repository: 'github://dalehenrich/sample:master/repository';
    register.
  projectSpec := Metacello registry
    baseline: 'Sample';
    list.
  self
    assert:
      projectSpec repositoryDescriptions asArray
        = {'github://dalehenrich/sample:master/repository'}