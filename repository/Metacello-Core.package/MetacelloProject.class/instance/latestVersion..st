versions
latestVersion: blessing
  ^ MetacelloPlatform current
    detectMax: [ :version | version ]
    in: (self map values select: [ :version | blessing = version blessing ])
