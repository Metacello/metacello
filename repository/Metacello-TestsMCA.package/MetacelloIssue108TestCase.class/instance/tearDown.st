running
tearDown
	| aGofer finalWorkingCopyList diff |
	super tearDown.
	MetacelloPlatform current
		removeGlobalNamed: self repositoryName
		ifAbsent: [  ].
	self tempRepositories
		do: [ :repo | MCRepositoryGroup default removeIdenticalRepository: repo ].
	aGofer := Gofer new.
	self tearDownPackageNames
		do: [ :pName | 
			(self hasPackage: pName)
				ifTrue: [ aGofer package: pName ] ].
	aGofer references notEmpty
		ifTrue: [ aGofer metacelloUnload ].
	finalWorkingCopyList := MetacelloPlatform current workingCopyNames.
	diff := finalWorkingCopyList difference: initialWorkingCopyList.
	diff
		do: [ :leak | 
			Transcript
				cr;
				show: 'leaked package from ' , self printString , ' -> ' , leak printString ].
	self assert: diff isEmpty