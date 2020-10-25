tests
testGetPrivateGitHubRepository

	| prevPassword prevUsername baseline |
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