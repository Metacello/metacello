baseline pragma - github reference
configurationGithubReferenceXX: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                configuration: 'External'
                with: [ 
                    spec
                        version: '0.9';
                        repository: 'github://dalehenrich/external:configuration/repository' ] ]