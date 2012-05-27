baseline pragma - github reference
configurationGithubReferenceIV: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec description: 'MetacelloScriptingResource>>configurationGithubReferenceIV:'.
            spec
                project: 'External'
                with: [ 
                    spec
                        version: '0.9';
                        repository: 'github://dalehenrich/external:configuration/repository' ] ]