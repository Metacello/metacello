*metacello-filetree
repositoryVersionString
  "extract sha from the repository directory ... if possible"

  | versionComponents versionElement pathElements githubPath repositoryDirPath projectDirPath projectDir projectVersionDir |
  repositoryDirPath := self directory fullName.
  projectDir := MCGitHubRepository cacheDirectoryFor: self projectPath.
  projectVersionDir := MCFileTreeFileUtils current
    directoryFromPath: self projectVersion
    relativeTo: projectDir.
  projectDirPath := projectVersionDir fullName.
  (repositoryDirPath beginsWith: projectDirPath)
    ifFalse: [ ^ self projectVersion ].
  githubPath := repositoryDirPath
    copyFrom: projectDirPath size + 2
    to: repositoryDirPath size.
  pathElements := githubPath findTokens: '/'.
  versionElement := pathElements at: 1.
  versionComponents := versionElement findTokens: '-'.
  ^ versionComponents last