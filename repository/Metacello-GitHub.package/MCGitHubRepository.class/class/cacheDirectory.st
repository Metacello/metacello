private
cacheDirectory
    ^ (MetacelloPlatform current fileDirectoryClass default directoryNamed: 'github-cache')
        assureExistence;
        yourself