tests
testInstanceMatch05

	self assert: 
		((MetacelloGoferPackage name: 'Seaside2' packageFilename: 'Seaside2.8')
			 matches: (GoferVersionReference name: 'Seaside2.8a1-lr.597')).
