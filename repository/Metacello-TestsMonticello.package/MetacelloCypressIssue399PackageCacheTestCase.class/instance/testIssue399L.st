tests
testIssue399L
  "https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231144979"

  "Issue399-Core package is in sampleRepository and externalRepository. BaselineOfIssue399 package is in external repository"

  "Confirm that a younger version of package will be loaded from repository"

  "See https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231464884"

  self
    setUpRepositoryContents: #('Issue399-Core-dkh.2')
    sourceRepo: MetacelloScriptingResource current sampleRepository
    targetRepo:
      (MetacelloPlatform current
        repositoryFromUrl: ('filetree://' , externalDirectory fullName) asUrl).
  Metacello new
    baseline: 'Issue399Cypress';
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
        repositoryFromUrl: ('filetree://' , externalDirectory fullName) asUrl).
  Metacello new
    baseline: 'Issue399Cypress';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self
    assert:
      (MetacelloPlatform current globalNamed: #'Issue399Sample' ifAbsent: [  ]) isNil.
  self
    assert:
      (MetacelloPlatform current globalNamed: #'Issue399External' ifAbsent: [  ])
        notNil	"Confirm that package from external repo loaded"