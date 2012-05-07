running
tearDownPackages: aGoferInstance
    #('ConfigurationOfExternalX' 'BaselineOfExternalX' 'External-CoreX' 'Sample-CoreX' 'ConfigurationOfMetacelloExample' 'GoferFoo' 'Sample-Core' 'Sample-Platform' 'Sample-Tests' 'External-Core')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]