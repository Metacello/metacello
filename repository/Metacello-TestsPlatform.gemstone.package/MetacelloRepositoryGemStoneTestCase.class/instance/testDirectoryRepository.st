tests
testDirectoryRepository

	| project pkg repoSpec repo |
	project := self project.
	pkg := (project version: '1.0-baseline') packageNamed: 'Example-Core'.
	repoSpec := pkg repositorySpecs first.
	self assert: repoSpec type = 'directory'.
	repo := repoSpec createRepository.
	self assert: repo class == MCServerDirectoryRepository.
	self assert: repo directory pathName = '/home/dhenrich/monticello'.
	self assert: repo directory class = ServerFileDirectory.
	
