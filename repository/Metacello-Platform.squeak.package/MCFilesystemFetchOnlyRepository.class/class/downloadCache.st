accessing
downloadCache
  RepoDownloadCache ifNil: [ RepoDownloadCache := Dictionary new ].
  ^ RepoDownloadCache