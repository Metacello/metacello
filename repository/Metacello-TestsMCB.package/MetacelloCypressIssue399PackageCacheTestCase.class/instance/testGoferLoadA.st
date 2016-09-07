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
	self
		assert:
			(MetacelloPlatform current globalNamed: #Issue399Sample ifAbsent: [  ])
				isNil.
	self
		assert:
			(MetacelloPlatform current
				globalNamed: #Issue399External
				ifAbsent: [  ]) notNil.	"Confirm that package from external package loaded"
	MCCacheRepository default flushCache