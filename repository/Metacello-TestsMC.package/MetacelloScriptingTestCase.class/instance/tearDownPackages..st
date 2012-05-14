running
tearDownPackages: aGoferInstance
    #('ConfigurationOfExternal' 'ConfigurationOfExternalX' 'ConfigurationOfExternalXX' 'BaselineOfGithubRef' 'BaselineOfExternal' 'BaselineOfExternalX' 'External-CoreX' 'Sample-CoreX' 'ConfigurationOfMetacelloExample' 'GoferFoo' 'Sample-Core' 'Sample-Platform' 'Sample-Tests' 'External-Core' 'External-Tests')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]