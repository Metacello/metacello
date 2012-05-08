external repository
versionOfX: spec
    <version: '0.9' baselineOf: 'ExternalX'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'initial work'.
            spec author: 'dkh'.
            spec timestamp: '5/4/2012 14:16' ].
    spec for: #'custom' do: [ spec repository: 'dictionary://Metacello_Configuration_Test_Repository' ]