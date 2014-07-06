initialize-release
hasNoLoadConflicts: anMCGitHubRepository
  Transcript
    cr;
    show: 'hasNoLoadConflicts: [0] ' , self description printString.
  (anMCGitHubRepository isKindOf: self class)
    ifFalse: [ ^ false ].
  Transcript
    cr;
    show:
        'hasNoLoadConflicts: [1] ' , anMCGitHubRepository description printString.
  ^ self projectPath = anMCGitHubRepository projectPath
    and: [ 
      self repoPath = anMCGitHubRepository repoPath
        and: [ self projectVersion = anMCGitHubRepository projectVersion ] ]