initialize-release
hasNoLoadConflicts: anMCGitBasedRepository

	| projectPath otherProjectPath |
	(anMCGitBasedRepository isKindOf: self class)
		ifFalse: [ ^ false ].
	
	projectPath := self projectPath.
	otherProjectPath := anMCGitBasedRepository projectPath.
	self isProjectPathCaseSensitive ifFalse: [
		projectPath := projectPath asLowercase.
		otherProjectPath := otherProjectPath asLowercase].
	
	^ projectPath = otherProjectPath
		and: [ self repoPath = anMCGitBasedRepository repoPath ]
		and: [ self projectVersion = anMCGitBasedRepository projectVersion ]