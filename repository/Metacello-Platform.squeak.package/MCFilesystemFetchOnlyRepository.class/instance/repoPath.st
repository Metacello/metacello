accessing
repoPath
	" if we were not give a repo path, there may be a .project file with more info "
	(repoPathValid ~~ true and: [repoPath isNil or: [repoPath isEmpty]]) ifTrue: [ | basicDirectory |
		basicDirectory := self class
			projectDirectoryFrom: self projectPath
			version: self projectVersion.
		
		" the parsed repo path will be an empty string or nil if none is found, as such we need an
		  extra variable to keep track whether we already did an expensive lookup to find the path "
		repoPathValid := true.
		repoPath := (basicDirectory fileExists: '.project') ifTrue: [
			basicDirectory readOnlyFileNamed: '.project' do: [:str | (STONJSON fromStream: str) at: #srcDirectory ifAbsent: ['']]]].
	
	^ repoPath