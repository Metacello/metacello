scripting
versionFrom: aScriptingEngine
    aScriptingEngine versionString ~~ nil
        ifTrue: [ ^ super versionFrom: aScriptingEngine ].
    ^ (self projectFrom: aScriptingEngine) version: 'baseline'