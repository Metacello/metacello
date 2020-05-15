accessing
repoPath
	" if we were not give a repo path, there may be a .project file with more info "
	(repoPath isNil or: [repoPath isEmpty]) ifTrue: [ | basicDirectory |
		basicDirectory := self class
			projectDirectoryFrom: self projectPath
			version: self projectVersion.
		
		repoPath := (basicDirectory fileExists: '.project') ifTrue: [
			basicDirectory readOnlyFileNamed: '.project' do: [:str | (STONJSON fromStream: str) at: #srcDirectory ifAbsent: ['']]]].
	
	^ repoPath