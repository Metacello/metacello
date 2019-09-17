tests
testIssue332DownloadTags
  "https://github.com/dalehenrich/metacello-work/issues/332"

  [ 
  | repo tags cache expectedTags rateLimitRemaining x |
  cache := MCGitHubRepository eTagsCache.
  repo := MCGitHubRepository
    parseLocation: 'github://dalehenrich/external:master/repository'
    version: nil.
  tags := repo downloadJSONTags.	"prime the value of X-RateLimit-Remaining"
  rateLimitRemaining := (cache at: 'dalehenrich/external')
    at: 'X-RateLimit-Remaining'.
  tags := repo downloadJSONTags.
  expectedTags := #('1.0-beta.32Tests' 'v1.1.1-gs' 'v1.1.2-gs' 'v1.2.0-gs' 'v1.2.0.1-gs' 'v1.2.0.2-gs' 'v1.3.0-gs' 'v2.1.0-gs' 'v2.2.0-gs' 'v3.0.0-gs').
  expectedTags do: [ :tag | tags at: tag ifAbsent: [ self assert: false ] ].
  x := (cache at: 'dalehenrich/external') at: 'X-RateLimit-Remaining'.
  Transcript
    cr;
    show:
        'testIssue332DownloadTags TRACE: ' , rateLimitRemaining asString , ' = '
            , x asString.
  self
    assert:
      rateLimitRemaining
        = (x := (cache at: 'dalehenrich/external') at: 'X-RateLimit-Remaining') ]
    on: Error
    do: [ :ex | 
      "keep an eye out for rate limiting errors from github for anonymous api usage"
      Transcript
        cr;
        show: 'testIssue332DownloadTags: ' , ex description.
      (MetacelloPlatform current
        string: ex description
        includesSubstring: 'API rate limit exceeded')
        ifFalse: [ 
          "don't fail test because github rate limit exceeded"
          ex pass ] ]