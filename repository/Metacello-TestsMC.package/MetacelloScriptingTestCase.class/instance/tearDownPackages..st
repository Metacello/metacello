running
tearDownPackages: aGoferInstance
    #('BaselineOfExternalX' 'External-CoreX' 'Sample-CoreX' 'ConfigurationOfMetacelloExample' 'GoferFoo' 'Sample-Core' 'Sample-Platform' 'Sample-Tests')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]