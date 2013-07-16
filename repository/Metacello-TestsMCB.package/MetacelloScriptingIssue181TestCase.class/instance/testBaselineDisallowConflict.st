running
testBaselineDisallowConflict
  "https://github.com/dalehenrich/metacello-work/issues/181"

  | wc |
  Metacello new
    configuration: 'Issue181';
    version: '0.9.1';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load.
  wc := (GoferPackageReference name: 'BaselineOfExternal') workingCopy.
  self assert: wc ancestry ancestors first name = 'BaselineOfExternal-dkh.3'.
  Metacello new
    configuration: 'Issue181';
    version: '0.9.2';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    onConflict: [ :ex | ex disallow ];
    silently;
    load.
  wc := (GoferPackageReference name: 'BaselineOfExternal') workingCopy.
  self assert: wc ancestry ancestors first name = 'BaselineOfExternal-dkh.3'