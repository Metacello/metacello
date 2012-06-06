running
tearDownPackages: aGoferInstance
    #('ConfigurationOfInvalidConfigurations')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]