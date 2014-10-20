initialize-release
flushCache
  "the directory acts like a cache since we download the directory from a git-based repository (github, bitbucket, etc.)"

  super flushCache.
  self class flushDownloadCache.
  directory := nil