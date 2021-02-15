api projectSpec
username: aString
	"Username to authenticate to the repository. Optional. See https://github.com/Metacello/metacello/pull/536. See also implementors of #siteUsername:."

	self addStatement: #'usernameArg:' args: {aString}