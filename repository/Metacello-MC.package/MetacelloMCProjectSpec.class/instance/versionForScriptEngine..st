scripting
versionForScriptEngine: aMetacelloScriptEngine
    ^ ((self project projectForScriptEngine: aMetacelloScriptEngine) version: self versionString)
        silently: aMetacelloScriptEngine silently;
        ignoreImage: aMetacelloScriptEngine ignoreImage;
        cacheRepository: aMetacelloScriptEngine cacheRepository