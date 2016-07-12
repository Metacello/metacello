tests
testGoferLoadB
  MCCacheRepository default flushCache.
  Gofer new
    repository: MetacelloScriptingResource current externalRepository;
    version: 'Issue399-Core-dkh.1';
    load.
  Gofer new
    repository: MetacelloScriptingResource current sampleRepository;
    version: 'Issue399-Core-dkh.2';
    load.
  self assert: (Smalltalk at: #'Issue399Sample' ifAbsent: [  ]) notNil.	"Confirm that sample package  loaded"
  self assert: (Smalltalk at: #'Issue399External' ifAbsent: [  ]) isNil.
  MCCacheRepository default flushCache