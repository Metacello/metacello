running
testIssue215a
  "https://github.com/dalehenrich/metacello-work/issues/215"

  | wc |
  Metacello new
    configuration: 'Issue181';
    version: '0.9.8';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load: 'GoferBar'.	"
---
  Issue181 0.9.8
    BaselineOfExternal
	   External-Core-dkh.5
	   External-Tests-dkh.2 (not loaded)"
  wc := (GoferPackageReference name: 'External-Core') workingCopy.
  self assert: wc ancestry ancestors first name = 'External-Core-dkh.5'.
  self
    should: [ (GoferPackageReference name: 'External-Tests-dkh.2') workingCopy ]
    raise: Error