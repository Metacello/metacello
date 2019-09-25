utility
projectDirectoryFrom: projectPath version: versionString
	| mcPlatform theCacheDirectory projectDirectory downloadCacheKey cachePath pid |
	downloadCacheKey := self
		downloadCacheKey: projectPath
		version: versionString.
	mcPlatform := MetacelloPlatform current.
	theCacheDirectory := mcPlatform
		directoryFromPath: versionString
		relativeTo: (self cacheDirectoryFor: projectPath).
	cachePath := self downloadCache at: downloadCacheKey ifAbsent: [  ].
	(cachePath isNil
		or: [ (projectDirectory := mcPlatform
				directoryFromPath: cachePath
				relativeTo: theCacheDirectory) exists not ])
		ifTrue: [ | url archive directory zipFileName |
			MetacelloScriptGitBasedDownloadNotification new
				projectPath: projectPath;
				versionString: versionString;
				signal.	"for testing purposes"
			mcPlatform ensureDirectoryExists: theCacheDirectory.
			url := self
				projectZipUrlFor: projectPath
				versionString: versionString.
			pid := mcPlatform processPID.
			zipFileName := mcPlatform
				tempFileFor:
					self basicDescription , '-' , pid , '-'
						, (downloadCacheKey select: [ :c | c isAlphaNumeric ])
				suffix: '.zip'.
			archive := mcPlatform
				downloadZipArchive: url
				to: zipFileName.
			directory := mcPlatform
				directoryFromPath: (cachePath := archive members first fileName)
				relativeTo: theCacheDirectory.
			archive close.
			directory exists
				ifTrue: [ mcPlatform deleteFileNamed: zipFileName ]
				ifFalse: [ mcPlatform
						extractRepositoryFrom: zipFileName
						to: theCacheDirectory fullName ].
			self downloadCache at: downloadCacheKey put: cachePath.
			projectDirectory := mcPlatform
				directoryFromPath: cachePath
				relativeTo: theCacheDirectory ].
	^ projectDirectory
