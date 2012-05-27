baseline:with:
versionOfXX: spec
    <version: '0.9'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec description: 'MetacelloScriptingResource>>versionOfXX:'.
            spec author: 'dkh'.
            spec timestamp: '5/4/2012 14:16' ].
    spec
        for: #'custom'
        do: [ 
            spec
                baseline: 'External'
                with: [ spec repository: 'github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository' ] ]