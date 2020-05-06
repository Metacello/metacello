private
cacheDirectory
  self resetCacheDirectoryIfInvalid.
  RepoCacheDirectory ifNil: [ RepoCacheDirectory := self defaultCacheDirectory ].
  ^ RepoCacheDirectory