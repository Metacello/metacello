running
tearDown
	| aGofer |
	super tearDown.
	aGofer := Gofer new.
	Smalltalk removeKey: self repositoryName ifAbsent: [  ].
	self tempRepositories do: [:repo | MCRepositoryGroup default removeRepository: repo ].
