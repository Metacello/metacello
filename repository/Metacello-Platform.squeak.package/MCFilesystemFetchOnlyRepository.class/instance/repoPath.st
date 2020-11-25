accessing
repoPath
	^ repoPath ifNil: [ | basicDirectory |
		" if we were not given a repo path, there may be a .project file with more info "
		basicDirectory := self
			projectDirectoryFrom: self projectPath
			version: self projectVersion.
		
		repoPath := (basicDirectory fileExists: '.project')
			ifTrue: [basicDirectory readOnlyFileNamed: '.project' do: [:str | (STONJSON fromStream: str) at: #srcDirectory ifAbsent: ['']]]
			ifFalse: ['']]