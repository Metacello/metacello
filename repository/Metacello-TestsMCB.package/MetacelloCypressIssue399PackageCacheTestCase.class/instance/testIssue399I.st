tests
testIssue399I
  "https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231144979"

  "Arrange for Issue399-Core-dkh.1 to be loaded from sample repo first and Issue399-Core-dkh.1 to be loaded from external second"

  "Confirms Issue #399 and is expected to fail"

  "See https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231464884"

  self
    setUpRepositoryContents: #('Issue399-Core-dkh.1')
    sourceRepo: MetacelloScriptingResource current sampleRepository
    targetRepo:
      (MetacelloPlatform current
        repositoryFromUrl: 'filetree://' , externalDirectory fullName) asUrl.
  Metacello new
    baseline: 'Issue399';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self
    assert:
      (MetacelloPlatform current globalNamed: #'Issue399Sample' ifAbsent: [  ]) notNil.	"Confirm that package from sample repo loaded"
  self
    assert:
      (MetacelloPlatform current globalNamed: #'Issue399External' ifAbsent: [  ])
        isNil.
  self
    setUpRepositoryContents: #('Issue399-Core-dkh.1')
    sourceRepo: MetacelloScriptingResource current externalRepository
    targetRepo:
      (MetacelloPlatform current
        repositoryFromUrl: 'filetree://' , externalDirectory fullName) asUrl.
  Metacello new
    baseline: 'Issue399';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self
    assert:
      (MetacelloPlatform current
        globalNamed: Smalltalk
        at: #'Issue399External'
        ifAbsent: [  ]) notNil	"Confirm that package from external repo loaded"