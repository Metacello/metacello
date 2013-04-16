private
cacheDirectoryFor: projectPath
    ^ (self cacheDirectory resolveString: projectPath)
        ensureDirectory;
        yourself