tests
testModifyDependentProject

	| configuration baseline11 newRepository |
	self createComplex11Baseline.
	newRepository := 'dictionary://ChangedRepository'.
	(MetacelloToolBox configurationNamed: self configurationName asString) 
		updateVersionMethodForVersion: '1.1-baseline'
		versionSpecsDo: [ :attribute :versionSpec | 
			attribute == #common 
				ifTrue: [ | dependentProject | 
					dependentProject := versionSpec packages detect: [ :spec | spec name = 'MetacelloTestConfigurationOfFoo' ]. 
					dependentProject referencedSpec repository: newRepository ]. 
			true ]; 
		commitMethod. 
	
	configuration := Smalltalk at: self configurationName.
	baseline11 := configuration project version: '1.1-baseline'.
	self assert: baseline11 projects first repository description equals: newRepository.