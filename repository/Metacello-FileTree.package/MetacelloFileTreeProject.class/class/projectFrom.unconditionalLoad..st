scripting
projectFrom: aScriptingEngine unconditionalLoad: unconditionalLoad
    "just create project right here ... from the metacello.json file"

    | repository directory |
    repository := aScriptingEngine repository.
    directory := repository directory.
    ^ [ 
    MetacelloFileTreeConstructor
        fromRepositoryPath: directory pathName
        forProject: aScriptingEngine projectName
        projectClass: self
        repository: aScriptingEngine repositorySpec ]
        on: FileDoesNotExistException
        do: [ :ex | aScriptingEngine getConfigurationProjectUnconditionalLoad: unconditionalLoad ]