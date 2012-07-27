scripting
versionForScriptEngine: aMetacelloScriptEngine
    ^ ((self projectClassProject projectForScriptEngine: aMetacelloScriptEngine) version: self versionString)
        silently: aMetacelloScriptEngine silently;
        ignoreImage: aMetacelloScriptEngine ignoreImage;
        cacheRepository: aMetacelloScriptEngine cacheRepository;
        repositoryOverrides: aMetacelloScriptEngine repositoryOverrides