baseline pragma - github reference
baselineGithubReferenceV: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec description: 'MetacelloScriptingResource>>baselineGithubReferenceV:'.
            spec
                baseline: 'External'
                with: [ spec repository: 'github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository' ] ]