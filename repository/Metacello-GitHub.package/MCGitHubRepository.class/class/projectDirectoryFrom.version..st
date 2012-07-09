utility
projectDirectoryFrom: projectPath version: versionString
    | githubCacheDirectory projectDirectory downloadCacheKey cachePath |
    downloadCacheKey := projectPath , ':::' , versionString.
    githubCacheDirectory := (self cacheDirectoryFor: projectPath) directoryNamed: versionString.
    cachePath := self downloadCache at: downloadCacheKey ifAbsent: [  ].
    (cachePath isNil or: [ (projectDirectory := githubCacheDirectory directoryNamed: cachePath) exists not ])
        ifTrue: [ 
            | url archive directory |
            githubCacheDirectory assureExistence.
            url := 'https://github.com/' , projectPath , '/zipball/' , versionString.
            archive := MetacelloPlatform current downloadFile: url to: '/tmp/github.zip'.
            directory := githubCacheDirectory directoryNamed: (cachePath := archive members first fileName).
            directory exists
                ifFalse: [ MetacelloPlatform current extractRepositoryFrom: '/tmp/github.zip' to: githubCacheDirectory fullName ].
            self downloadCache at: downloadCacheKey put: cachePath.
            projectDirectory := githubCacheDirectory directoryNamed: cachePath ].
    ^ projectDirectory