tests
testIssue27Caching
    | repoDescription githubRepo |
    repoDescription := 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'.
    Metacello new
        baseline: 'External';
        repository: repoDescription;
        get.
    githubRepo := MCRepositoryGroup default repositories detect: [ :repo | repo description = repoDescription ].
    githubRepo directory containingDirectory containingDirectory containingDirectory recursiveDelete.
    githubRepo flushCache.
    Metacello new
        baseline: 'External';
        repository: repoDescription;
        get.
    self halt