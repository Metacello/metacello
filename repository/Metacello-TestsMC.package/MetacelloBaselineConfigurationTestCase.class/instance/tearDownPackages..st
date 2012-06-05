running
tearDownPackages: aGoferInstance
    #('BaselineOfExternalX' 'BaselineOfExternalXX' 'BaselineOfExternalXXX' 'BaselineOfGithubRefXI')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]