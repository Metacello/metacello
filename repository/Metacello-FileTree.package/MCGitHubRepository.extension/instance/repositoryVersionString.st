*metacello-filetree
repositoryVersionString
  "extract sha from the repository directory ... if possible"

  | versionComponents versionElement pathElements githubPath repositoryDirPath projectDirPath projectDir |
  repositoryDirPath := self directory fullName.
  projectDir := MCGitHubRepository cacheDirectoryFor: self projectPath.
  projectDirPath := (projectDir directoryNamed: self projectVersion) fullName.
  (repositoryDirPath beginsWith: projectDirPath)
    ifFalse: [ ^ self projectVersion ].
  githubPath := repositoryDirPath
    copyFrom: projectDirPath size + 2
    to: repositoryDirPath size.
  pathElements := githubPath findTokens: '/'.
  versionElement := pathElements at: 1.
  versionComponents := versionElement findTokens: '-'.
  ^ versionComponents last