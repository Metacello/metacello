running
testIssue215c
  "https://github.com/dalehenrich/metacello-work/issues/215"

  | wc |
  Metacello new
    baseline: 'Issue215';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load: 'External-Tests'.	"
---
  Issue181 0.9.8
    BaselineOfExternal
	   External-Core-dkh.5
	   External-Tests-dkh.2"
  wc := (GoferPackageReference name: 'External-Core') workingCopy.
  self assert: wc ancestry ancestors first name = 'External-Core-dkh.5'.
  wc := (GoferPackageReference name: 'External-Tests') workingCopy.
  self assert: wc ancestry ancestors first name = 'External-Tests-dkh.2'