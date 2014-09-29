api repository shortcuts
gitoriousUser: userName project: projectName commitish: commitish path: path
  | branchOrCommitOrTag |
  branchOrCommitOrTag := commitish.
  branchOrCommitOrTag isEmpty
    ifTrue: [ branchOrCommitOrTag := 'master' ].
  self
    repository:
      'gitorious://' , userName , '/' , projectName , ':' , branchOrCommitOrTag , '/'
        , path