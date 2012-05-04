utility
writeJsonFor: filePath
    "self writeJsonFor:'/foos1/users/dhenrich/smalltalk/sample/metacello/sample'"

    | versionSpecBlock dir fStream constructor |
    [ 
    dir := FileDirectory on: filePath.
    fStream := dir oldFileNamed: 'metacello.st'.
    [ constructor := Compiler evaluate: fStream contents ]
        ensure: [ fStream close ].
    dir
        forceNewFileNamed: 'metacello.json'
        do: [ :fileStream | 
            fileStream lineEndConvention: #'lf'.
            constructor jsonOn: fileStream ] ]
        on: MetacelloErrorInProjectConstructionNotification
        do: [ :ex | ex resume: true ]