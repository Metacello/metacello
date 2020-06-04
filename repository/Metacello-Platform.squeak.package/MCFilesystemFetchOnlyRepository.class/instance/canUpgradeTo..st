initialize-release
canUpgradeTo: anMCGitBasedRepository
  ((anMCGitBasedRepository isKindOf: self class) or: [anMCGitBasedRepository isKindOf: MCGitBasedNetworkRepository])
    ifFalse: [ ^ false ].
  ^ self projectPath = anMCGitBasedRepository projectPath
    and: [ self repoPath = anMCGitBasedRepository repoPath ]