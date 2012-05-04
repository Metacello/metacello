scripting
versionFrom: aScriptingEngine
    | project version |
    project := self projectFrom: aScriptingEngine.
    (version := aScriptingEngine versionString) ifNil: [ ^ project latestVersion ].
    ^ project version: version