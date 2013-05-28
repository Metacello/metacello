tests
testIssue27Caching
    | repoDescription githubRepo platform |
    repoDescription := 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'.
    Metacello new
        baseline: 'External';
        repository: repoDescription;
        get.
    githubRepo := MCRepositoryGroup default repositories detect: [ :repo | repo description = repoDescription ].
    MetacelloPlatform current recursiveDelete: (githubRepo directory containingDirectory containingDirectory containingDirectory).
	platform := MetacelloPlatform current.
	platform
		recursiveDelete: (platform
				parentDirectory: (platform
						parentDirectory: (platform parentDirectory: githubRepo directory))).
						    githubRepo flushCache.
    Metacello new
        baseline: 'External';
        repository: repoDescription;
        get
