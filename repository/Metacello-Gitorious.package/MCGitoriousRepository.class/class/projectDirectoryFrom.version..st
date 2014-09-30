utility
projectDirectoryFrom: projectPath version: versionString
  | mcPlatform theCacheDirectory projectDirectory downloadCacheKey cachePath pid |
  downloadCacheKey := self downloadCacheKey: projectPath version: versionString.
  mcPlatform := MetacelloPlatform current.
  theCacheDirectory := mcPlatform
    directoryFromPath: versionString
    relativeTo: (self cacheDirectoryFor: projectPath).
  cachePath := self downloadCache at: downloadCacheKey ifAbsent: [  ].
  (cachePath isNil
    or: [ 
      (projectDirectory := mcPlatform
        directoryFromPath: cachePath
        relativeTo: theCacheDirectory) exists not ])
    ifTrue: [ 
      | url gunzipFileName |
      MetacelloScriptGitBasedDownloadNotification new
        projectPath: projectPath;
        versionString: versionString;
        signal.	"for testing purposes"
      mcPlatform ensureDirectoryExists: theCacheDirectory.
      url := self projectZipUrlFor: projectPath versionString: versionString.
      pid := MetacelloPlatform current processPID.
      gunzipFileName := MetacelloPlatform current
        tempFileFor:
          self basicDescription , '-' , pid , '-'
            , (downloadCacheKey select: [ :c | c isAlphaNumeric ])
        suffix: '.tar.gz'.
      MetacelloPlatform current downloadTarFile: url to: gunzipFileName.
      cachePath := MetacelloPlatform current
        extractTarGzFrom: gunzipFileName
        to: theCacheDirectory fullName.
      self downloadCache at: downloadCacheKey put: cachePath.
      projectDirectory := mcPlatform
        directoryFromPath: cachePath
        relativeTo: theCacheDirectory ].
  ^ projectDirectory