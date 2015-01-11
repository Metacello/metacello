testing
isDowngrade
  | loadedVersion overrideVersion |
  (self hasOverride and: [ self hasLoaded ])
    ifFalse: [ ^ false ].
  (loadedVersion := self loadedProjectSpec versionOrNil) ifNil: [ ^ false ].
  (overrideVersion := self overrideProjectSpec versionOrNil) ifNil: [ ^ false ].
  ^ loadedVersion > overrideVersion