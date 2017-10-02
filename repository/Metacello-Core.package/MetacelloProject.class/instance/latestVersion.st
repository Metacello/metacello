versions
latestVersion
  | excluded |
  "	self deprecated: 'Please use #stableVersion instead.'.
"
  self flag: 'deprecate after version 1.0'.
  excluded := self excludeFromLatestVersion.
  ^ MetacelloPlatform current
    detectMax: [ :version | version ]
    in: (self map values
        select: [ :version | (excluded includes: version blessing) not ])
