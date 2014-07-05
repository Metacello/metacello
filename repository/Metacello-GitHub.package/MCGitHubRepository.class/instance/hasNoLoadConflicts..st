initialize-release
hasNoLoadConflicts: anMCGitHubRepository
  (anMCGitHubRepository isKindOf: self class)
    ifFalse: [ ^ false ].
  ^ self projectPath = anMCGitHubRepository projectPath
    and: [ 
      self repoPath = anMCGitHubRepository repoPath
        and: [ self projectVersion = anMCGitHubRepository projectVersion ] ]