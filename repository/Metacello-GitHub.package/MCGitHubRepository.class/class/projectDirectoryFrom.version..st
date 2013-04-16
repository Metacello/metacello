utility
projectDirectoryFrom: projectPath version: versionString
	| githubCacheDirectory projectDirectory downloadCacheKey cachePath |
	downloadCacheKey := self downloadCacheKey: projectPath version: versionString.
	githubCacheDirectory := (self cacheDirectoryFor: projectPath) / versionString.
	cachePath := self downloadCache at: downloadCacheKey ifAbsent: [  ].
	(cachePath isNil or: [ (projectDirectory := githubCacheDirectory / cachePath) exists not ])
		ifTrue: [ 
			| url archive directory |
			MetacelloScriptGitHubDownloadNotification new
				projectPath: projectPath;
				versionString: versionString;
				signal.	"for testing purposes"
			githubCacheDirectory ensureDirectory.
			url := 'https://github.com/' , projectPath , '/zipball/' , versionString.
			archive := MetacelloPlatform current downloadFile: url to: '/tmp/github.zip'.
			directory := githubCacheDirectory / (cachePath := archive members first fileName).
			directory exists
				ifFalse: [ MetacelloPlatform current extractRepositoryFrom: '/tmp/github.zip' to: githubCacheDirectory fullName ].
			self downloadCache at: downloadCacheKey put: cachePath.
			projectDirectory := githubCacheDirectory / cachePath ].
	^ projectDirectory