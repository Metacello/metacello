tests
testIssue399B
  "https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231144979"

  "Issue399-Core package is in sampleRepository and externalRepository. BaselineOfIssue399 package is in external repository"

  "Verify that a package with same name/version in package-cache is not involved in load"

  "See https://github.com/dalehenrich/metacello-work/issues/399#issuecomment-231464884"

  MCCacheRepository default flushCache.
  self
    setUpRepositoryContents: #('Issue399-Core-dkh.1')
    sourceRepo: MetacelloScriptingResource current sampleRepository
    targetRepo: MCCacheRepository default.	"prime package-cache with sample package"
  Metacello new
    baseline: 'Issue399Cypress';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    load.
  self assert: (Smalltalk at: #'Issue399Sample' ifAbsent: [  ]) isNil.
  self assert: (Smalltalk at: #'Issue399External' ifAbsent: [  ]) notNil.	"Confirm that package from external repo loaded"
  MCCacheRepository default flushCache