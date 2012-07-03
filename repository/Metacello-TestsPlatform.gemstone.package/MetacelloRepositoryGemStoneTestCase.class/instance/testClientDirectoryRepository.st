tests
testClientDirectoryRepository

	| project pkg repoSpec repo |
	project := self project.
	pkg := (project version: '1.1-baseline') packageNamed: 'Example-Core'.
	repoSpec := pkg repositorySpecs first.
	self assert: repoSpec type = 'clientDirectory'.
	repo := repoSpec createRepository.
	self assert: repo class == MCDirectoryRepository.
	self assert: repo directory pathName = '/home/dhenrich/monticello'.
	self assert: repo directory class = FileDirectory.
	
