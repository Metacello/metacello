baseline pragma - github reference
baselineGithubReferenceXXX: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec description: 'MetacelloScriptingResource>>baselineGithubReferenceXXX:'.
            spec
                baseline: 'External'
                with: [ 
                    spec
                        version: MetacelloScriptingResource externalCustomSHA;
                        repository: 'github://dalehenrich/external/repository' ] ]

