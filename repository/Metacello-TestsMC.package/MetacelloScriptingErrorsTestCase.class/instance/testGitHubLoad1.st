tests
testGitHubLoad1
    self
        should: [ 
            Metacello new
                configuration: 'External';
                repository:
                        'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository';
                load ]
        raise: MetacelloPackageSpecResolutionError