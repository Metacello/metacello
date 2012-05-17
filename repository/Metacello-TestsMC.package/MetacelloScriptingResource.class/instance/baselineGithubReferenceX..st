baseline pragma - github reference
baselineGithubReferenceX: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                project: 'External'
                with: [ 
                    spec
                        className: 'BaselineOfExternal';
                        repository: 'github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository' ] ]