accessing
password: aString
	"Password or access token to authenticate to the repository. Optional. Depending on the repository provider, the username might be optional if an access token is provided as a password. Can be provided via Metacello >> #username: or self class >> #siteUsername:."

	password := aString.