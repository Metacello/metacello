running
tearDownPackages: aGoferInstance
    #('BaselineOfExternalX' 'BaselineOfExternalXX' 'BaselineOfExternalXXX')
        do: [ :packageName | 
            (self hasPackage: packageName)
                ifTrue: [ aGoferInstance package: packageName ] ]