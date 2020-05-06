accessing
repoPath
	" if we were not give a repo path, there may be a .project file with more info "
	(repoPath isNil or: [repoPath isEmpty]) ifTrue: [ | basicDirectory stonjson |
		basicDirectory := self class
			projectDirectoryFrom: self projectPath
			version: self projectVersion.
		stonjson := Smalltalk at: #STONJSON ifAbsent: [nil].
		
		repoPath := (stonjson notNil and: [basicDirectory fileExists: '.project'])
			ifTrue: [basicDirectory readOnlyFileNamed: '.project' do: [:str | (stonjson fromStream: str) at: #srcDirectory ifAbsent: ['']]]
			ifFalse: ['']].
	
	^ repoPath