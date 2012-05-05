running
tearDownPackages: aGoferInstance
	(self hasPackage: 'BaselineOfExternalX')
		ifTrue: [ aGoferInstance package: 'BaselineOfExternalX' ]