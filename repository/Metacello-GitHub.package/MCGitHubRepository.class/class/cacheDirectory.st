private
cacheDirectory
    ^ (FileDirectory default directoryNamed: 'github-cache')
        assureExistence;
        yourself