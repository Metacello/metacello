package cache
clearPackageCache
  "make sure that the package cache is empty, by hook or by crook"

  | cache dir |
  cache := self defaultPackageCache.
  dir := cache directory.
  dir ~~ nil
    ifTrue: [ 
      "delete directory - Squeak and Pharo"
      dir exists
        ifTrue: [ self recursiveDelete: dir ] ]
    ifFalse: [ 
      "MCDictionaryRepository expected - GemStone"
      cache flushCache ]