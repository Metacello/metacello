running
tearDownPackages: aGoferInstance
    #('BaselineOfExternalX' 'BaselineOfExternalXX' 'BaselineOfExternalXXX' 'BaselineOfGithubRefV' 'BaselineOfGithubRefVI' 'BaselineOfGithubRefIV' 'BaselineOfGithubRefIX' 'BaselineOfGithubRefXI' 'BaselineOfGithubRefXII' 'BaselineOfGithubRefXIII')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]