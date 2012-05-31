accessing
versionForScriptEngine: aMetacelloScriptEngine
    ^ (configurationProjectSpec ifNil: [ baselineProjectSpec ]) versionForScriptEngine: aMetacelloScriptEngine