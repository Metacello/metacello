tests
testFileTreeGetConfigurationBasicSpecXXX
    "avoid resolving to BaselineOf .... use basicSpec"

    | project basicSpec expected |
    [ 
    project := Metacello new
        project: 'ExternalXXX';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    basicSpec := (project version: '0.9') basicSpec ]
        on: MetacelloErrorInProjectConstructionNotification
        do: [ :ex | ex resume: true ].
    expected := 'spec blessing: #''development''.
spec description: ''MetacelloScriptingResource>>versionOfXXX:''.
spec author: ''dkh''.
spec timestamp: ''5/4/2012 14:16''.
spec baseline: ''External'' with: [
		spec repository: ''github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository'' ].'.
    self assert: basicSpec printString = expected