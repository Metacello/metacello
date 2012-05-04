metacello release process
copyConfigToRepos
	"In order for username and password to be set correctly, you must already have the MetacelloRepository
	 (on GemSource) repository set up"

	| targetRepository1 targetRepository2 gofer version |
	targetRepository1 := MCHttpRepository location: 'http://www.squeaksource.com/MetacelloRepository' user: '' password: ''.

	targetRepository2 := MCHttpRepository location: 'http://seaside.gemstone.com/ss/MetacelloRepository' user: '' password: ''.
	"need to pick up existing repository with user and password set"
	targetRepository2 := MCRepositoryGroup default repositories
		detect: [ :each | each = targetRepository2 ]
		ifNone: [ targetRepository2 ].

	gofer := (Smalltalk at: #Gofer) new
		gemsource: 'metacello';
		package: 'ConfigurationOfMetacello'.
	version := gofer resolved first version.
	(Array with: targetRepository1 with: targetRepository2) do: [:repo | repo storeVersion: version ]