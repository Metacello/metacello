initialize-release
canUpgradeTo: anMCGitHubRepository
  Transcript
    cr;
    show: 'canUpgradeTo: [0] ' , self description printString.
  (anMCGitHubRepository isKindOf: self class)
    ifFalse: [ ^ false ].
  Transcript
    cr;
    show: 'canUpgradeTo: [1] ' , anMCGitHubRepository description printString.
  ^ self projectPath = anMCGitHubRepository projectPath
    and: [ self repoPath = anMCGitHubRepository repoPath ]