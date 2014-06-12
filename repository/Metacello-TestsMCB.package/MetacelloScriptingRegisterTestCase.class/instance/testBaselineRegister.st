tests
testBaselineRegister
  [ 
  | projectSpec |
  Metacello new
    baseline: 'Sample';
    repository: 'filetree:///opt/git/sample';
    register.
  projectSpec := Metacello registry
    baseline: 'Sample';
    list.
  self
    assert:
      projectSpec repositoryDescriptions asArray = {'filetree:///opt/git/sample'} ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: ex description;
        show: (GsProcess stackReportToLevel: 100).
      ex pass ]