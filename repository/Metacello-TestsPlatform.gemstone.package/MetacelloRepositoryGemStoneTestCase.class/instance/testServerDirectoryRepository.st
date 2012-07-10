tests
testServerDirectoryRepository

	| project pkg repoSpec repo |
	project := self project.
	pkg := (project version: '1.2-baseline') packageNamed: 'Example-Core'.
	repoSpec := pkg repositorySpecs first.
	self assert: repoSpec type = 'serverDirectory'.
	repo := repoSpec createRepository.
	self assert: repo class == MCServerDirectoryRepository.
	self assert: repo directory pathName = '/opt/mcexamples'.
	self assert: repo directory class = ServerFileDirectory.
	
