running
tearDownPackages: aGoferInstance
    #('BaselineOfExternalX' 'BaselineOfExternalXX' 'BaselineOfExternalXXX' 'BaselineOfGithubRefV' 'BaselineOfGithubRefVI' 'BaselineOfGithubRefIV' 'BaselineOfGithubRefIX' 'BaselineOfGithubRefXI' 'BaselineOfGithubRefXII')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]