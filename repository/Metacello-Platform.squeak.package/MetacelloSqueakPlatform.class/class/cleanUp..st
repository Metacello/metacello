initialize-release
cleanUp: aggressive

	Smalltalk globals at: #MCGitHubRepository ifPresent: [:c |
		c flushETagsCache].
	Smalltalk globals at: #MCFetchGithubRepository ifPresent: [:c |
		c flushETagsCache].