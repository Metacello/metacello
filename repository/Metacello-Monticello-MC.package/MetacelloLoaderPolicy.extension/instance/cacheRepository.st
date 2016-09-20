*metacello-monticello-mc
cacheRepository
  cacheRepository == nil
    ifTrue: [ cacheRepository := MetacelloPlatform current defaultCacheRepository ].
  ^ cacheRepository