scripting
projectFrom: aScriptingEngine unconditionalLoad: unconditionalLoad
    "just create project right here ... from the metacello.json file"

    ^ [ 
    self
        location: aScriptingEngine repositoryDescription
        version: aScriptingEngine versionString
        forProject: aScriptingEngine projectName ]
        on: FileDoesNotExistException
        do: [ :ex | aScriptingEngine getConfigurationProjectUnconditionalLoad: unconditionalLoad ]