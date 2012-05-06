running
tearDownPackages: aGoferInstance
    #('BaselineOfExternalX' 'External-CoreX' 'Sample-CoreX' 'ConfigurationOfMetacelloExample' 'GoferFoo')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]