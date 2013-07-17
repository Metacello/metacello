initialize-release
hasNoLoadConflicts: anMCGitHubRepository
  ^ self projectPath = anMCGitHubRepository projectPath
    and: [ self repoPath = anMCGitHubRepository repoPath ]