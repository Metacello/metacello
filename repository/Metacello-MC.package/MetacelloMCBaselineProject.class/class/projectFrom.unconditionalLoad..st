scripting
projectFrom: aScriptingEngine unconditionalLoad: aBool
    "if there is a ConfigurationOf, then snag it, otherwise attempt to grab BaselineOf"

    | project |
    [ 
    project := super projectFrom: aScriptingEngine unconditionalLoad: aBool.
    project versions do: [ :version | version spec repository: aScriptingEngine repositorySpec description ].
    ^ project ]
        on: MetacelloPackageSpecResolutionError
        do: [ :ex | 
            project := (aScriptingEngine getBaselineUnconditionalLoad: aBool) project.
            project version spec repository: aScriptingEngine repositorySpec description.
            ^ project ]