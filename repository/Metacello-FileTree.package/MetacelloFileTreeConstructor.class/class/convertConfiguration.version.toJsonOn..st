utility
convertConfiguration: baseName version: inputVersionStringOrSymbol toJsonOn: aStream
    "[ 
    (FileDirectory on: '/foos1/users/dhenrich/smalltalk/metacello/')
        forceNewFileNamed: 'metacello.json'
        do: [ :fileStream | 
            fileStream lineEndConvention: #'lf'.
            MetacelloFileTreeConstructor
                convertConfiguration: 'ConfigurationOfGitMetacello'
                version: 'baseline'
                toJsonOn: fileStream ] ]
        on: MetacelloErrorInProjectConstructionNotification
        do: [ :ex | ex resume: true ]."

    | configurationName |
    configurationName := MetacelloScriptEngine configurationNameFrom: baseName.
    self
        convert: (MetacelloPlatform current globalNamed: configurationName asSymbol) project
        version: inputVersionStringOrSymbol
        toJsonOn: aStream