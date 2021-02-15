tests
testGetGithubRepositorySiteCredentials

	| prevPassword prevUsername baseline |
	(Smalltalk classNamed: #MCFetchGithubRepository) ifNil: [
		Transcript cr; show: 'Skipping test, not applicable'.
		thisContext home return].
	
	prevUsername := MCFetchGithubRepository siteUsername.
	prevPassword := MCFetchGithubRepository sitePassword.
	[MCFetchGithubRepository
		siteUsername: MetacelloScriptingResource privateExternalUser;
		sitePassword: MetacelloScriptingResource privateExternalPassword.
		
		baseline := Metacello new
			baseline: 'External';
			repository:
				'github://LinqLover/MetacelloTest-External:'
				, MetacelloScriptingResource externalCustomSHA
				, '/repository';
			get.
		
		self assert: baseline notNil
	
	] ensure: [MCFetchGithubRepository
		siteUsername: prevUsername;
		sitePassword: prevPassword]