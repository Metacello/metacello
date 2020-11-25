api projectSpec
password: aString
	"Password or access token to authenticate to the repository. Optional. Depending on the repository provider, the username might be optional if an access token is provided as a password. See https://github.com/Metacello/metacello/pull/536. See also implementors of #sitePassword:."

	self addStatement: #'passwordArg:' args: {aString}