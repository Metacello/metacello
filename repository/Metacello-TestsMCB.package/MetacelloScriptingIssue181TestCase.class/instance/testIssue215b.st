running
testIssue215b
  "https://github.com/dalehenrich/metacello-work/issues/215"

  | wc |
  Metacello new
    configuration: 'Issue181';
    version: '0.9.8';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load: 'GoferFoo'.	"
---
  Issue181 0.9.8
    BaselineOfExternal
	   External-Core-dkh.5
	   External-Tests-dkh.2"
  wc := (GoferPackageReference name: 'External-Core') workingCopy.
  self assert: wc ancestry ancestors first name = 'External-Core-dkh.5'.
  wc := (GoferPackageReference name: 'External-Tests') workingCopy.
  self assert: wc ancestry ancestors first name = 'External-Tests-dkh.2'