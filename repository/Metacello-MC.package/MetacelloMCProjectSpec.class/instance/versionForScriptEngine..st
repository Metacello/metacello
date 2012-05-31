scripting
versionForScriptEngine: aMetacelloScriptEngine
    | proj version |
    proj := self project projectForScriptEngine: aMetacelloScriptEngine.
    (version := self versionString) ifNil: [ ^ proj latestVersion ].
    ^ proj version: version