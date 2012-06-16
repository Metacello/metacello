utility
projectDirectoryFrom: projectPath version: versionString
    | githubCacheDirectory projectDirectory downloadCacheKey cachePath |
    downloadCacheKey := projectPath , ':::' , versionString.
    githubCacheDirectory := (self cacheDirectoryFor: projectPath) directoryNamed: versionString.
    cachePath := self downloadCache
        at: downloadCacheKey
        ifAbsent: [ 
            | url archive directory |
            url := 'https://github.com/' , projectPath , '/zipball/' , versionString.
            self downloadFile: url to: '/tmp/github.zip'.
            archive := ZipArchive new
                readFrom: (FileStream readOnlyFileNamed: '/tmp/github.zip');
                yourself.
            directory := githubCacheDirectory directoryNamed: archive members first fileName.
            directory exists
                ifFalse: [ archive extractAllTo: githubCacheDirectory ].
            self downloadCache at: downloadCacheKey put: archive members first fileName ].
    ^ githubCacheDirectory directoryNamed: cachePath