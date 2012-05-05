running
tearDownPackages: aGoferInstance
	(self hasPackage: 'External-CoreX')
		ifTrue: [ aGoferInstance package: 'External-CoreX' ].
	(self hasPackage: 'Sample-CoreX')
		ifTrue: [ aGoferInstance package: 'Sample-CoreX' ].
	(self hasPackage: 'ConfigurationOfMetacelloExample')
		ifTrue: [ aGoferInstance package: 'ConfigurationOfMetacelloExample' ].
	(self hasPackage: 'GoferFoo')
		ifTrue: [ aGoferInstance package: 'GoferFoo' ]