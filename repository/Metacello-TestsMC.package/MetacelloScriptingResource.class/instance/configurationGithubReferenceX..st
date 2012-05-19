baseline pragma - github reference
configurationGithubReferenceX: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec description: 'MetacelloScriptingResource>>configurationGithubReferenceX:'.
            spec
                project: 'External'
                with: [ 
                    spec
                        className: 'ConfigurationOfExternal';
                        version: '0.9';
                        repository: 'github://dalehenrich/external:configuration/repository' ] ]