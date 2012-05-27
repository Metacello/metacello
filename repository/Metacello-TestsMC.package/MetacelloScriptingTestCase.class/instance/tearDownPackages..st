running
tearDownPackages: aGoferInstance
    #('ConfigurationOfExternal' 'ConfigurationOfExternalX' 'ConfigurationOfExternalXX' 'ConfigurationOfExternalXXX' 'ConfigurationOfExternalIV' 'ConfigurationOfExternalIV' 'BaselineOfExternalX' 'BaselineOfGithubRefXX' 'BaselineOfGithubRefXXX' 'BaselineOfGithubRefIV' 'BaselineOfGithubRefV' 'BaselineOfGithubRefVI' 'BaselineOfGithubRefVII' 'BaselineOfExternal' 'BaselineOfExternalX' 'External-CoreX' 'Sample-CoreX' 'ConfigurationOfMetacelloExample' 'GoferFoo' 'Sample-Core' 'Sample-Platform' 'Sample-Tests' 'External-Core' 'External-Tests' 'BaselineOfGithubRefVIII' 'BaselineOfGithubRefIX')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]