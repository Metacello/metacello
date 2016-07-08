tests
testGoferLoadA
  MCCacheRepository default flushCache.
  Gofer new
    repository: MetacelloScriptingResource current sampleRepository;
    version: 'Issue399-Core-dkh.2';
    load.
  Gofer new
    repository: MetacelloScriptingResource current externalRepository;
    version: 'Issue399-Core-dkh.1';
    load.
  self assert: (Smalltalk at: #'Issue399Sample' ifAbsent: [  ]) isNil.
  self assert: (Smalltalk at: #'Issue399External' ifAbsent: [  ]) notNil.	"Confirm that package from external package loaded"
  MCCacheRepository default flushCache