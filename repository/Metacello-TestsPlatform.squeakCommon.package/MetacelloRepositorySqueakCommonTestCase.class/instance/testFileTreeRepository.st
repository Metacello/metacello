tests
testFileTreeRepository
    | project pkg repoSpec repo |
    Smalltalk at: #'MCFileTreeRepository' ifAbsent: [ ^ self ].
    project := self project.
    pkg := (project version: '1.6-baseline') packageNamed: 'Example-Core'.
    repoSpec := pkg repositorySpecs first.
    self assert: repoSpec type = 'filetree'.
    repo := repoSpec createRepository.
    self assert: repo class == (Smalltalk at: #'MCFileTreeRepository' ifAbsent: [  ]).
    self assert: repo description = 'filetree:///opt/mcfiletree'