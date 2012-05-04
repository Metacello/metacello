running
tearDownPackages: aGoferInstance
    (self hasPackage: 'External-Core')
        ifTrue: [ aGoferInstance package: 'External-Core' ].
    (self hasPackage: 'Sample-Core')
        ifTrue: [ aGoferInstance package: 'Sample-Core' ].
    (self hasPackage: 'Sample-Platform')
        ifTrue: [ aGoferInstance package: 'Sample-Platform' ].
    (self hasPackage: 'Sample-Tests')
        ifTrue: [ aGoferInstance package: 'Sample-Tests' ]