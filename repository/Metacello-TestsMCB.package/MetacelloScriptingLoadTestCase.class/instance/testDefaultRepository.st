tests
testDefaultRepository
  | projectSpec |
  Metacello new
    configuration: 'Sample';
    lock.
  projectSpec := (Metacello registry
    configuration: 'Sample';
    list) first.
  self
    assert:
      projectSpec repositoryDescriptions asArray
        = {(MetacelloScriptEngine defaultRepositoryDescription)}