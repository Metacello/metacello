version:baselineOf: pragma
versionOfXX: spec
    <version: '0.9' baselineOf: 'External'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'initial work: first commit on custom branch'.
            spec author: 'dkh'.
            spec timestamp: '5/4/2012 14:16'.
            spec repository: 'github://dalehenrich/external/repository' ].
    spec for: #'custom' do: [ spec version: '957492f31b77026d81dcb165c07c69b2ad897781' ]