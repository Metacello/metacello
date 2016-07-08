tests
testIssue399C
  "https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231144979"

  "Issue399-Core package is in sampleRepository and externalRepository. BaselineOfIssue399 package is in external repository"

  "Verify that the version of package loaded in image is not an issue"

  "See https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231464884"

  Gofer new
    repository: MetacelloScriptingResource current sampleRepository;
    version: 'Issue399-Core-dkh.2';
    load.
  Metacello new
    baseline: 'Issue399';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self assert: (Smalltalk at: #'Issue399Sample' ifAbsent: [  ]) isNil.
  self assert: (Smalltalk at: #'Issue399External' ifAbsent: [  ]) notNil	"Confirm that package from external repo loaded"