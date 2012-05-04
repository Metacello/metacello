instance creation
fromRepositoryPath: filetreeRepositoryPath forProject: projectName projectClass: projectClass repository: repositoryDescription
    | project |
    (FileDirectory on: filetreeRepositoryPath , FileDirectory slash , 'metacello' , FileDirectory slash , projectName)
        oldFileNamed: 'metacello.json'
        do: [ :fileStream | 
            fileStream lineEndConvention: #'lf'.
            project := self fromStream: fileStream projectClass: projectClass.
            (project version: 'baseline') spec repository: repositoryDescription.
            ^ project ]