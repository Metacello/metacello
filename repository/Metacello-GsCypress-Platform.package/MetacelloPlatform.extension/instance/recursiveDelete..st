*Metacello-GsCypress-Platform
recursiveDelete: aDirectoryPath
  "delete this directory and all children of it"

  ^ CypressFileUtilities current deleteAll: aDirectoryPath
