site credentials
sitePassword: aString
	"Default password or access token used to authenticate to all repositories of this repository provider. Optional. Can be overridden using Metacello >> #password:. Depending on the repository provider, the username might be optional if an access token is provided as a password. See https://github.com/Metacello/metacello/pull/534."

	sitePassword := aString