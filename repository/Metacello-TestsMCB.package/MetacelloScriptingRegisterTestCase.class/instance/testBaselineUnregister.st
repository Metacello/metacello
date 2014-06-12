tests
testBaselineUnregister
  | projectSpec |
  Metacello new
    baseline: 'Sample';
    repository: 'filetree:///opt/git/sample';
    register.
  Metacello registry
    baseline: 'Sample';
    repository: 'filetree:///opt/git/sample';
    unregister.
  projectSpec := Metacello registry
    baseline: 'Sample';
    list.
  self assert: projectSpec isEmpty