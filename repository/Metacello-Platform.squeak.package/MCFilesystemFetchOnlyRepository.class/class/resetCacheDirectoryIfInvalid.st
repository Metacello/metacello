private
resetCacheDirectoryIfInvalid
  "Reset if invalid"

  RepoCacheDirectory notNil
    and: [ 
      (MCFileTreeFileUtils current directoryExists: RepoCacheDirectory)
        ifFalse: [ RepoCacheDirectory := nil ] ]