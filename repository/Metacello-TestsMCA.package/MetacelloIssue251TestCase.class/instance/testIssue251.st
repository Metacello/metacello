tests
testIssue251
  "https://github.com/dalehenrich/metacello-work/issues/251"

  | project version expected actual versionSpec seasideSpec |
  project := self class new project.
  version := project version: '1.0'.
  versionSpec := version spec.
  seasideSpec := versionSpec packages map at: 'Seaside3'.
  actual := seasideSpec printString.
  expected := 'spec 
	name: ''Seaside3'';
	projectReference: [
		spec
			repository: ''github://glassdb/Seaside31:3.1.1-gs31/repository'' ].'.
  self assert: actual = expected