tests
testGetGithubRepositoryScriptingAPI

	| baseline |
	(Smalltalk classNamed: #MCFetchGithubRepository) ifNil: [
		Transcript cr; show: 'Skipping test, not applicable'.
		thisContext home return].
	
	baseline := Metacello new
		baseline: 'External';
		repository:
			'github://LinqLover/MetacelloTest-External:'
			, MetacelloScriptingResource externalCustomSHA
			, '/repository';
		username: MetacelloScriptingResource privateExternalUser;
		password: MetacelloScriptingResource privateExternalPassword;
		get.
	
	self assert: baseline notNil.