scripting
projectFrom: aScriptingEngine unconditionalLoad: aBool
    "if there is a ConfigurationOf, then snag it, otherwise attempt to grab BaselineOf"

    [ ^ super projectFrom: aScriptingEngine unconditionalLoad: aBool ]
        on: MetacelloPackageSpecResolutionError
        do: [ :ex | 
            | project |
            project := (aScriptingEngine getBaselineUnconditionalLoad: aBool) project.
            project version spec repository: aScriptingEngine repositorySpec description.
            ^ project ]