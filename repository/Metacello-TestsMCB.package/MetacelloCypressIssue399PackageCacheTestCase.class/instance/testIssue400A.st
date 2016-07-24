tests
testIssue400A
  "https://github.com/dalehenrich/metacello-work/issues/400"

  | cacheRepo |
  cacheRepo := Smalltalk
    at: #'Metacello_Cache_Test_Repository'
    put: MCDictionaryRepository new.
  self
    setUpRepositoryContents: #('Issue399-Core-dkh.1')
    sourceRepo: MetacelloScriptingResource current sampleRepository
    targetRepo: cacheRepo.	"prime cacheRepo with sample package"
  MCCacheRepository default flushCache.
  Metacello new
    baseline: 'Issue399';
    repository: 'filetree://' , externalDirectory fullName;
    cacheRepository: 'dictionary://Metacello_Cache_Test_Repository';
    load.
  self assert: (Smalltalk at: #'Issue399Sample' ifAbsent: [  ]) notNil.	"Confirm that package from package-cache loaded"
  self assert: (Smalltalk at: #'Issue399External' ifAbsent: [  ]) isNil