external repository
baselineGithubReference: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec
                project: 'External'
                with: [ 
                    spec
                        version: '957492f31b77026d81dcb165c07c69b2ad897781';
                        repository: 'github://dalehenrich/external/repository' ] ]