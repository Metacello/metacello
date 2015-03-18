tests
testIssue332DownloadTags
  "https://github.com/dalehenrich/metacello-work/issues/332"

  | repo tags cache expectedTags rateLimitRemaining x |
  cache := MCGitHubRepository eTagsCache.
  rateLimitRemaining := (cache at: 'dalehenrich/external')
    at: 'X-RateLimit-Remaining'.
  repo := MCGitHubRepository
    parseLocation: 'github://dalehenrich/external:1.1.?/repository'
    version: nil.
  tags := repo downloadJSONTags.
  expectedTags := #('1.0-beta.32Tests' 'v1.1.1-gs' 'v1.1.2-gs' 'v1.2.0-gs' 'v1.2.0.1-gs' 'v1.2.0.2-gs' 'v1.3.0-gs' 'v2.1.0-gs' 'v2.2.0-gs' 'v3.0.0-gs').
  expectedTags do: [ :tag | tags at: tag ifAbsent: [ self assert: false ] ].
  self
    assert:
      rateLimitRemaining
        = (x := (cache at: 'dalehenrich/external') at: 'X-RateLimit-Remaining')