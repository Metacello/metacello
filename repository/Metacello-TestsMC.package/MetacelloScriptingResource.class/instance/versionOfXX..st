external repository
versionOfXX: spec
    <version: '0.9' baselineOf: 'External'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'initial work'.
            spec author: 'dkh'.
            spec timestamp: '5/4/2012 14:16'.
            spec repository: 'github://dalehenrich/external/repository' ].
    spec for: #'pharo' do: [ spec repositoryVersion: '5f5c3b9435de497f1ed92b553728ec2ec67530ca' ]