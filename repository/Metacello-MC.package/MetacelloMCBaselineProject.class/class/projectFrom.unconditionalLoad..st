scripting
projectFrom: aScriptingEngine unconditionalLoad: aBool
    | project |
    project := (aScriptingEngine getBaselineUnconditionalLoad: aBool) project.
    project version spec repository: aScriptingEngine repositorySpec printString.
    ^ project