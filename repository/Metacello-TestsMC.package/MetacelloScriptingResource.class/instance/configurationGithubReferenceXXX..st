baseline pragma - github reference
configurationGithubReferenceXXX: spec
    <baseline>
    spec
        for: #'common'
        do: [ 
            spec description: 'MetacelloScriptingResource>>configurationGithubReferenceXXX:'.
            spec
                configuration: 'External'
                with: [ 
                    spec
                        version: '0.9';
                        repository: 'http://ss3.gemstone.com/ss/external' ] ]